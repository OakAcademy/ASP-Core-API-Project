using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WPFPersonalTracking.Views
{
    /// <summary>
    /// Interaction logic for APIDepartmentList.xaml
    /// </summary>
    public partial class APIDepartmentList : UserControl
    {
        public APIDepartmentList()
        {
            InitializeComponent();
        }

        private  void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            filldatagrid();
        }
       async void filldatagrid()
        {
            using (HttpClient client = new HttpClient())
            {
                HttpResponseMessage responseMessage = await client.GetAsync("http://localhost:24537/api/departments");
                if (responseMessage.IsSuccessStatusCode)
                {
                    var jsonstring = await responseMessage.Content.ReadAsStringAsync();
                    List<APIDepartment> list = JsonConvert.DeserializeObject<List<APIDepartment>>(jsonstring);
                    gridDepartment.ItemsSource = list;
                }
                else
                    MessageBox.Show("Server Error");
            }
        }
        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            APIDepartmentPage page = new APIDepartmentPage();

            page.ShowDialog();
            filldatagrid();
        }
        APIDepartment apidepartment = new APIDepartment();
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            if (apidepartment == null)
                MessageBox.Show("Please select a department from table");
            else
            {
                APIDepartmentPage page = new APIDepartmentPage();
                page.apidepartment = apidepartment;
                page.ShowDialog();
                filldatagrid();
            }
        }

        private void gridDepartment_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            apidepartment = (APIDepartment)gridDepartment.SelectedItem;
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (apidepartment == null)
                MessageBox.Show("Please select a department from table");
            else
            {
                if(MessageBox.Show("Are you sure to delete","Delete",MessageBoxButton.YesNo,MessageBoxImage.Warning)==
                    MessageBoxResult.Yes)
                {
                    HttpClient client = new HttpClient();
                    HttpResponseMessage responseMessage = await client.DeleteAsync("http://localhost:24537/api/departments/" + apidepartment.DepartmentId);
                    if (responseMessage.IsSuccessStatusCode)
                    {
                        MessageBox.Show("Department was deleted");
                        filldatagrid();
                    }
                    else
                        MessageBox.Show("API server error");
                }
            }
        }
    }
}
