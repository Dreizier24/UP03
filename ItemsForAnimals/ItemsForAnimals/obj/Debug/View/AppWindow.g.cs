﻿#pragma checksum "..\..\..\View\AppWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "3ED27E0674FB811328979F0FDE602241269A77C26F125D4B00F7BECF0D84FCE1"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using ItemsForAnimals.View;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace ItemsForAnimals.View {
    
    
    /// <summary>
    /// AppWindow
    /// </summary>
    public partial class AppWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 81 "..\..\..\View\AppWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnAddNewUser;
        
        #line default
        #line hidden
        
        
        #line 93 "..\..\..\View\AppWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnEditUser;
        
        #line default
        #line hidden
        
        
        #line 105 "..\..\..\View\AppWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnDeleteUser;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/ItemsForAnimals;component/view/appwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\View\AppWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.btnAddNewUser = ((System.Windows.Controls.Button)(target));
            
            #line 82 "..\..\..\View\AppWindow.xaml"
            this.btnAddNewUser.Click += new System.Windows.RoutedEventHandler(this.btnAddNewUser_Click);
            
            #line default
            #line hidden
            return;
            case 2:
            this.btnEditUser = ((System.Windows.Controls.Button)(target));
            
            #line 94 "..\..\..\View\AppWindow.xaml"
            this.btnEditUser.Click += new System.Windows.RoutedEventHandler(this.btnEditUser_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.btnDeleteUser = ((System.Windows.Controls.Button)(target));
            
            #line 106 "..\..\..\View\AppWindow.xaml"
            this.btnDeleteUser.Click += new System.Windows.RoutedEventHandler(this.btnDeleteUser_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

