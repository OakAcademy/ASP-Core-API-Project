   M S B A M L   `   `   `  ����E  AWPFFromAPI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null'clr-namespace:WPFFromAPI
WPFFromAPI  5   	       WPFFromAPI.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   *localclr-namespace:WPFFromAPI     5   	   -   5          � Title$  
MainWindow��5   	   $	��300��6   $	��500��6)    � WindowStartupLocation$ CenterScreen=�65    � 
ResizeMode$ NoResize=�6Z   ���	#FF8EAFF7$��18(�6�   $
��Bold"�6�   .��5	      �  � RowDefinitions 5
   
   �� 5      $��4* �6   �� 5      $��* �6   .+�5   
   &   System.Windows.Controls.DataGrid  -   5          Name$ gridDepartment��5      $��Stretch=�6+   $��Stretch=�6I      
IsReadOnly$
 True��6e      AutoGenerateColumns$ False��6w      SelectionUnit$ FullRow=�6�      Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn	   Header$	 Id��6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 * 61   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6;   �� *DepartmentId+  5      $	 Department Name��6%   $
 4* 6>    6I   �� *DepartmentName+5      � 5   
   $��1��6   $��Stretch=�6   $��Stretch=�6:   $
��auto��6V   $
��auto��6d    � ColumnDefinitions 5      �� 5      �� 5      �� 5      �� 5      .+�5      �� -   5         ��Name$ btnAdd��5      $	��Add��6%   $��Stretch=�63   $��Stretch=�6Q   $��10,10,10,10q�6m   6�   �� 5      -   5        $ 	btnUpdate��5      $��Update��6(   $��1��69   $��Stretch=�6I   $��Stretch=�6g   $��10,10,10,10q�6�   6�   �� 5      -   5        $ 	btnDelete��5      $��Delete��6(   $��2��69   $��Stretch=�6I   $��Stretch=�6g   $��10,10,10,10q�6�   6�   �� 5      -   5        $ btnClose��5      $��Close��6'   $��3��67   $��Stretch=�6G   $��Stretch=�6e   $��10,10,10,10q�6�   6�   5      5       5!      