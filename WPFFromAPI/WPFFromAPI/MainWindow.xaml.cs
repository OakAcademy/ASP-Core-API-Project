using Newtonsoft.Json;
using Prism.Services.Dialogs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WPFFromAPI
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private  void Window_Loaded(object sender, RoutedEventArgs e)
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
                    List<Department> list = JsonConvert.DeserializeObject<List<Department>>(jsonstring);
                    gridDepartment.ItemsSource = list;

                }
                else
                    MessageBox.Show("API Error");
            }
        }
        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            DepartmentPage page = new DepartmentPage();
            this.Visibility = Visibility.Hidden;
            page.ShowDialog();
            filldatagrid();
            this.Visibility = Visibility.Visible;
        }
        Department department = new Department();
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            if (department == null)
                MessageBox.Show("Select a department from table");
            else
            {
                DepartmentPage page = new DepartmentPage();
                this.Visibility = Visibility.Hidden;
                page.department = department;
                page.ShowDialog();
                this.Visibility = Visibility.Visible;
                filldatagrid();
            }
        }

        private void gridDepartment_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            department = (Department)gridDepartment.SelectedItem;
        }

        private async void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (department == null)
                MessageBox.Show("Please select a department from table");
            else
            {
                if(MessageBox.Show("Are you sure to delete","Delete",MessageBoxButton.YesNo,MessageBoxImage.Warning)==MessageBoxResult.Yes)
                {
                    using (HttpClient client=new HttpClient())
                    {
                        HttpResponseMessage responseMessage = await client.DeleteAsync("http://localhost:24537/api/departments/" + department.DepartmentId);
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            MessageBox.Show("Department was deleted");
                            filldatagrid();
                        }
                        else
                            MessageBox.Show("Not found");
                    }
                }
            }
        }
    }
}
