   M S B A M L   `   `   `  ����N  JWPFPersonalTracking, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:WPFPersonalTrackingWPFPersonalTracking  5   	   +    %WPFPersonalTracking.APIDepartmentPage   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:WPFPersonalTracking     5   	   -   5          � Title$  Department Page��5       � WindowStartupLocation$ CenterScreen=�6    � 
ResizeMode$ NoResize=�6C   $��18(�6Y   $
��Bold"�6g   $	��200��6y   $	��350��6�    � Icon$ 	/Logo.png��6�   ���	#FF8EAFF7.��5	      �  � ColumnDefinitions 5
   
   �� 5      $	��12* �6   �� 5      $
��163* �6   �� 5      $
��175* �6    � RowDefinitions 5   
   �� 5      $��* �6   �� 5      $��* �6   .+�5   
   �� $��Department Name��6   $
��Left=�6*   $��Center=�6E   $��2��6`   $��4,0,0,0q�6t   �� 5   
   -   5         ��Name$ txtDepartmentName��5      $��2��6-   $	��148��6=   $
��Left=�6I   $��Center=�6d    �� TextWrapping$
 Wrap=�6   �� 5   
   -   5         ��Name$ btnSave��5      $
��Save��6"   $��1��61   $	��100��6>   $��50,0,0,0q�6J   $
��Left=�6\   $��Center=�6w   $��1��6�   �� 5   
   -   5        $ btnClose��5      $��Close��6#   $��2��63   $��1��6C   $	��100��6P   $��13,0,0,0q�6\   $��Center=�6n   $
��Left=�6�   6�   5      5      