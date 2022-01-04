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

namespace WPFFromAPI
{
    /// <summary>
    /// Interaction logic for DepartmentPage.xaml
    /// </summary>
    public partial class DepartmentPage : Window
    {
        public DepartmentPage()
        {
            InitializeComponent();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        public Department department;
        private async void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (txtDepartmentName.Text.Trim() == "")
                MessageBox.Show("Please fill the department name area");
            else
            {
                if (department != null)
                {
                    using (HttpClient client=new HttpClient())
                    {
                        department.DepartmentName = txtDepartmentName.Text;
                        var jsondepartment = JsonConvert.SerializeObject(department);
                        StringContent content = new StringContent(jsondepartment, Encoding.UTF8, "application/json");
                        HttpResponseMessage responseMessage = await client.PutAsync("http://localhost:24537/api/departments", content);
                        if (responseMessage.IsSuccessStatusCode)
                            MessageBox.Show("Department was updated");
                        else
                            MessageBox.Show("API error");
                    }
                }
                else
                {
                    Department department = new Department();
                    department.DepartmentName = txtDepartmentName.Text;
                    HttpClient client = new HttpClient();
                    var jsondepartment = JsonConvert.SerializeObject(department);
                    StringContent content = new StringContent(jsondepartment, Encoding.UTF8, "application/json");
                    HttpResponseMessage responseMessage = await client.PostAsync("http://localhost:24537/api/departments", content);
                    if (responseMessage.IsSuccessStatusCode)
                    {
                        MessageBox.Show("Department was added");
                        txtDepartmentName.Clear();
                    }
                    else
                        MessageBox.Show("API Error");

                }

            }
        }

        private void btnSave_Loaded(object sender, RoutedEventArgs e)
        {
            if (department != null)
                txtDepartmentName.Text = department.DepartmentName;
        }
    }
}
