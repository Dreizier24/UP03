   M S B A M L   `   `   `  ����G  CProject_UP03, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null5clr-namespace:Project_UP03.ViewProject_UP03.View  5   	   $    Project_UP03.View.WorkerWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   1localclr-namespace:Project_UP03.View     5   	   $	��100��5   	   $	��100��6     � 
ResizeMode$  NoResize=�6(    � Title$ WorkerWindow��5	   	   $	��350��6   $	��400��6+    � WindowStartupLocation$ CenterScreen=�67   ���	#FF3A3F58.��5
      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� ���	#FFEE6A59 J� Opacity$ 1Q�6(   ._�5      �� $ 1Q�5      $
��Left=�5       �� Orientation$ 
Horizontal=�5      $��0��5      .+�5      �� ���	#FFECE6CD��6   �� *	FirstName+66   �� 5      ���	#FFECE6CD��6   �� *
MiddleName+67   �� 5      ���	#FFECE6CD��6   �� *
LastName+65   5      5      �� 5    
   $��10q�5!      $��1��5"      .+�5#      �� $��	Ваш Id��5$      ���	#FFF9AC676"   �� 5%      ��5&      �� *
WorkerId+5'      �� 5*   
   $��2��5+      $��10q�5,      .+�5-      �� $)��#Описание прооблемы��5.      ���	#FFF9AC676.   �� 5/      $	��150��50   +   ��6   �� *
TaskText+6+   51      �� 55   
   -   5        $��btnSend��5:      $��10q�57      $��3��58      $��Отправить��59      ���	#FFEE6A59���	#FFECE6CD5<      5>      5?      