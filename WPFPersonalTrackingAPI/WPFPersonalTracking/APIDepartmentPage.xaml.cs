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
using System.Windows.Shapes;

namespace WPFPersonalTracking
{
    /// <summary>
    /// Interaction logic for APIDepartmentPage.xaml
    /// </summary>
    public partial class APIDepartmentPage : Window
    {
        public APIDepartmentPage()
        {
            InitializeComponent();
        }
        public APIDepartment apidepartment;
        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txtDepartmentName.Text.Trim() == "")
                MessageBox.Show("Please fill department name");
            else
            {
                if (apidepartment != null)
                {
                    using (HttpClient client=new HttpClient())
                    {
                        apidepartment.DepartmentName = txtDepartmentName.Text;
                        var jsondepartment = JsonConvert.SerializeObject(apidepartment);
                        StringContent content = new StringContent(jsondepartment, Encoding.UTF8, "application/json");
                        HttpResponseMessage responseMessage = await client.PutAsync("http://localhost:24537/api/departments", content);
                        if (responseMessage.IsSuccessStatusCode)
                            MessageBox.Show("Department was updated");
                        else
                            MessageBox.Show("API Server error");
                    }
                }
                else
                {
                    APIDepartment apidepartment = new APIDepartment();
                    apidepartment.DepartmentName = txtDepartmentName.Text;
                    using (HttpClient client = new HttpClient())
                    {
                        var jsondepartment = JsonConvert.SerializeObject(apidepartment);
                        StringContent content = new StringContent(jsondepartment, Encoding.UTF8, "application/json");
                        HttpResponseMessage responseMessage = await client.PostAsync("http://localhost:24537/api/departments", content);
                        if (responseMessage.IsSuccessStatusCode)
                        {
                            MessageBox.Show("Department was added");
                            txtDepartmentName.Clear();
                        }
                        else
                            MessageBox.Show("API server error");

                    }
                }

            }
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (apidepartment != null)
                txtDepartmentName.Text = apidepartment.DepartmentName;

        }
    }
}
