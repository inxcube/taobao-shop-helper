﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.4927
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This code was auto-generated by Microsoft.Silverlight.ServiceReference, version 3.0.40624.0
// 
namespace Top.Client.Components.DM.ServiceReference1 {
    using System.Runtime.Serialization;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ApiBaseInfo", Namespace="http://schemas.datacontract.org/2004/07/Top.Server.Wcf.Contract.TaobaoInterface")]
    [System.Runtime.Serialization.KnownTypeAttribute(typeof(Top.Client.Components.DM.ServiceReference1.FullShopInfo))]
    public partial class ApiBaseInfo : object, System.ComponentModel.INotifyPropertyChanged {
        
        private string CreatedField;
        
        private string ModifiedField;
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Created {
            get {
                return this.CreatedField;
            }
            set {
                if ((object.ReferenceEquals(this.CreatedField, value) != true)) {
                    this.CreatedField = value;
                    this.RaisePropertyChanged("Created");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Modified {
            get {
                return this.ModifiedField;
            }
            set {
                if ((object.ReferenceEquals(this.ModifiedField, value) != true)) {
                    this.ModifiedField = value;
                    this.RaisePropertyChanged("Modified");
                }
            }
        }
        
        public event System.ComponentModel.PropertyChangedEventHandler PropertyChanged;
        
        protected void RaisePropertyChanged(string propertyName) {
            System.ComponentModel.PropertyChangedEventHandler propertyChanged = this.PropertyChanged;
            if ((propertyChanged != null)) {
                propertyChanged(this, new System.ComponentModel.PropertyChangedEventArgs(propertyName));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "3.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="FullShopInfo", Namespace="http://schemas.datacontract.org/2004/07/Top.Server.Wcf.Contract.TaobaoInterface")]
    public partial class FullShopInfo : Top.Client.Components.DM.ServiceReference1.ApiBaseInfo {
        
        private string BulletinField;
        
        private string CidField;
        
        private string DescriptionField;
        
        private string LogoUrlField;
        
        private int RemainShowcaseField;
        
        private string SellerNickField;
        
        private string SidField;
        
        private string TitleField;
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Bulletin {
            get {
                return this.BulletinField;
            }
            set {
                if ((object.ReferenceEquals(this.BulletinField, value) != true)) {
                    this.BulletinField = value;
                    this.RaisePropertyChanged("Bulletin");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Cid {
            get {
                return this.CidField;
            }
            set {
                if ((object.ReferenceEquals(this.CidField, value) != true)) {
                    this.CidField = value;
                    this.RaisePropertyChanged("Cid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Description {
            get {
                return this.DescriptionField;
            }
            set {
                if ((object.ReferenceEquals(this.DescriptionField, value) != true)) {
                    this.DescriptionField = value;
                    this.RaisePropertyChanged("Description");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string LogoUrl {
            get {
                return this.LogoUrlField;
            }
            set {
                if ((object.ReferenceEquals(this.LogoUrlField, value) != true)) {
                    this.LogoUrlField = value;
                    this.RaisePropertyChanged("LogoUrl");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int RemainShowcase {
            get {
                return this.RemainShowcaseField;
            }
            set {
                if ((this.RemainShowcaseField.Equals(value) != true)) {
                    this.RemainShowcaseField = value;
                    this.RaisePropertyChanged("RemainShowcase");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string SellerNick {
            get {
                return this.SellerNickField;
            }
            set {
                if ((object.ReferenceEquals(this.SellerNickField, value) != true)) {
                    this.SellerNickField = value;
                    this.RaisePropertyChanged("SellerNick");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Sid {
            get {
                return this.SidField;
            }
            set {
                if ((object.ReferenceEquals(this.SidField, value) != true)) {
                    this.SidField = value;
                    this.RaisePropertyChanged("Sid");
                }
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Title {
            get {
                return this.TitleField;
            }
            set {
                if ((object.ReferenceEquals(this.TitleField, value) != true)) {
                    this.TitleField = value;
                    this.RaisePropertyChanged("Title");
                }
            }
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference1.IShopApiFacade")]
    public interface IShopApiFacade {
        
        [System.ServiceModel.OperationContractAttribute(AsyncPattern=true, Action="http://tempuri.org/IShopApiFacade/GetFullShopInfoByNick", ReplyAction="http://tempuri.org/IShopApiFacade/GetFullShopInfoByNickResponse")]
        System.IAsyncResult BeginGetFullShopInfoByNick(string nick, System.AsyncCallback callback, object asyncState);
        
        Top.Client.Components.DM.ServiceReference1.FullShopInfo EndGetFullShopInfoByNick(System.IAsyncResult result);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public interface IShopApiFacadeChannel : Top.Client.Components.DM.ServiceReference1.IShopApiFacade, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class GetFullShopInfoByNickCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        public GetFullShopInfoByNickCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        public Top.Client.Components.DM.ServiceReference1.FullShopInfo Result {
            get {
                base.RaiseExceptionIfNecessary();
                return ((Top.Client.Components.DM.ServiceReference1.FullShopInfo)(this.results[0]));
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "3.0.0.0")]
    public partial class ShopApiFacadeClient : System.ServiceModel.ClientBase<Top.Client.Components.DM.ServiceReference1.IShopApiFacade>, Top.Client.Components.DM.ServiceReference1.IShopApiFacade {
        
        private BeginOperationDelegate onBeginGetFullShopInfoByNickDelegate;
        
        private EndOperationDelegate onEndGetFullShopInfoByNickDelegate;
        
        private System.Threading.SendOrPostCallback onGetFullShopInfoByNickCompletedDelegate;
        
        private BeginOperationDelegate onBeginOpenDelegate;
        
        private EndOperationDelegate onEndOpenDelegate;
        
        private System.Threading.SendOrPostCallback onOpenCompletedDelegate;
        
        private BeginOperationDelegate onBeginCloseDelegate;
        
        private EndOperationDelegate onEndCloseDelegate;
        
        private System.Threading.SendOrPostCallback onCloseCompletedDelegate;
        
        public ShopApiFacadeClient() {
        }
        
        public ShopApiFacadeClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public ShopApiFacadeClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ShopApiFacadeClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public ShopApiFacadeClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public System.Net.CookieContainer CookieContainer {
            get {
                System.ServiceModel.Channels.IHttpCookieContainerManager httpCookieContainerManager = this.InnerChannel.GetProperty<System.ServiceModel.Channels.IHttpCookieContainerManager>();
                if ((httpCookieContainerManager != null)) {
                    return httpCookieContainerManager.CookieContainer;
                }
                else {
                    return null;
                }
            }
            set {
                System.ServiceModel.Channels.IHttpCookieContainerManager httpCookieContainerManager = this.InnerChannel.GetProperty<System.ServiceModel.Channels.IHttpCookieContainerManager>();
                if ((httpCookieContainerManager != null)) {
                    httpCookieContainerManager.CookieContainer = value;
                }
                else {
                    throw new System.InvalidOperationException("Unable to set the CookieContainer. Please make sure the binding contains an HttpC" +
                            "ookieContainerBindingElement.");
                }
            }
        }
        
        public event System.EventHandler<GetFullShopInfoByNickCompletedEventArgs> GetFullShopInfoByNickCompleted;
        
        public event System.EventHandler<System.ComponentModel.AsyncCompletedEventArgs> OpenCompleted;
        
        public event System.EventHandler<System.ComponentModel.AsyncCompletedEventArgs> CloseCompleted;
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.IAsyncResult Top.Client.Components.DM.ServiceReference1.IShopApiFacade.BeginGetFullShopInfoByNick(string nick, System.AsyncCallback callback, object asyncState) {
            return base.Channel.BeginGetFullShopInfoByNick(nick, callback, asyncState);
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        Top.Client.Components.DM.ServiceReference1.FullShopInfo Top.Client.Components.DM.ServiceReference1.IShopApiFacade.EndGetFullShopInfoByNick(System.IAsyncResult result) {
            return base.Channel.EndGetFullShopInfoByNick(result);
        }
        
        private System.IAsyncResult OnBeginGetFullShopInfoByNick(object[] inValues, System.AsyncCallback callback, object asyncState) {
            string nick = ((string)(inValues[0]));
            return ((Top.Client.Components.DM.ServiceReference1.IShopApiFacade)(this)).BeginGetFullShopInfoByNick(nick, callback, asyncState);
        }
        
        private object[] OnEndGetFullShopInfoByNick(System.IAsyncResult result) {
            Top.Client.Components.DM.ServiceReference1.FullShopInfo retVal = ((Top.Client.Components.DM.ServiceReference1.IShopApiFacade)(this)).EndGetFullShopInfoByNick(result);
            return new object[] {
                    retVal};
        }
        
        private void OnGetFullShopInfoByNickCompleted(object state) {
            if ((this.GetFullShopInfoByNickCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.GetFullShopInfoByNickCompleted(this, new GetFullShopInfoByNickCompletedEventArgs(e.Results, e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void GetFullShopInfoByNickAsync(string nick) {
            this.GetFullShopInfoByNickAsync(nick, null);
        }
        
        public void GetFullShopInfoByNickAsync(string nick, object userState) {
            if ((this.onBeginGetFullShopInfoByNickDelegate == null)) {
                this.onBeginGetFullShopInfoByNickDelegate = new BeginOperationDelegate(this.OnBeginGetFullShopInfoByNick);
            }
            if ((this.onEndGetFullShopInfoByNickDelegate == null)) {
                this.onEndGetFullShopInfoByNickDelegate = new EndOperationDelegate(this.OnEndGetFullShopInfoByNick);
            }
            if ((this.onGetFullShopInfoByNickCompletedDelegate == null)) {
                this.onGetFullShopInfoByNickCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnGetFullShopInfoByNickCompleted);
            }
            base.InvokeAsync(this.onBeginGetFullShopInfoByNickDelegate, new object[] {
                        nick}, this.onEndGetFullShopInfoByNickDelegate, this.onGetFullShopInfoByNickCompletedDelegate, userState);
        }
        
        private System.IAsyncResult OnBeginOpen(object[] inValues, System.AsyncCallback callback, object asyncState) {
            return ((System.ServiceModel.ICommunicationObject)(this)).BeginOpen(callback, asyncState);
        }
        
        private object[] OnEndOpen(System.IAsyncResult result) {
            ((System.ServiceModel.ICommunicationObject)(this)).EndOpen(result);
            return null;
        }
        
        private void OnOpenCompleted(object state) {
            if ((this.OpenCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.OpenCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void OpenAsync() {
            this.OpenAsync(null);
        }
        
        public void OpenAsync(object userState) {
            if ((this.onBeginOpenDelegate == null)) {
                this.onBeginOpenDelegate = new BeginOperationDelegate(this.OnBeginOpen);
            }
            if ((this.onEndOpenDelegate == null)) {
                this.onEndOpenDelegate = new EndOperationDelegate(this.OnEndOpen);
            }
            if ((this.onOpenCompletedDelegate == null)) {
                this.onOpenCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnOpenCompleted);
            }
            base.InvokeAsync(this.onBeginOpenDelegate, null, this.onEndOpenDelegate, this.onOpenCompletedDelegate, userState);
        }
        
        private System.IAsyncResult OnBeginClose(object[] inValues, System.AsyncCallback callback, object asyncState) {
            return ((System.ServiceModel.ICommunicationObject)(this)).BeginClose(callback, asyncState);
        }
        
        private object[] OnEndClose(System.IAsyncResult result) {
            ((System.ServiceModel.ICommunicationObject)(this)).EndClose(result);
            return null;
        }
        
        private void OnCloseCompleted(object state) {
            if ((this.CloseCompleted != null)) {
                InvokeAsyncCompletedEventArgs e = ((InvokeAsyncCompletedEventArgs)(state));
                this.CloseCompleted(this, new System.ComponentModel.AsyncCompletedEventArgs(e.Error, e.Cancelled, e.UserState));
            }
        }
        
        public void CloseAsync() {
            this.CloseAsync(null);
        }
        
        public void CloseAsync(object userState) {
            if ((this.onBeginCloseDelegate == null)) {
                this.onBeginCloseDelegate = new BeginOperationDelegate(this.OnBeginClose);
            }
            if ((this.onEndCloseDelegate == null)) {
                this.onEndCloseDelegate = new EndOperationDelegate(this.OnEndClose);
            }
            if ((this.onCloseCompletedDelegate == null)) {
                this.onCloseCompletedDelegate = new System.Threading.SendOrPostCallback(this.OnCloseCompleted);
            }
            base.InvokeAsync(this.onBeginCloseDelegate, null, this.onEndCloseDelegate, this.onCloseCompletedDelegate, userState);
        }
        
        protected override Top.Client.Components.DM.ServiceReference1.IShopApiFacade CreateChannel() {
            return new ShopApiFacadeClientChannel(this);
        }
        
        private class ShopApiFacadeClientChannel : ChannelBase<Top.Client.Components.DM.ServiceReference1.IShopApiFacade>, Top.Client.Components.DM.ServiceReference1.IShopApiFacade {
            
            public ShopApiFacadeClientChannel(System.ServiceModel.ClientBase<Top.Client.Components.DM.ServiceReference1.IShopApiFacade> client) : 
                    base(client) {
            }
            
            public System.IAsyncResult BeginGetFullShopInfoByNick(string nick, System.AsyncCallback callback, object asyncState) {
                object[] _args = new object[1];
                _args[0] = nick;
                System.IAsyncResult _result = base.BeginInvoke("GetFullShopInfoByNick", _args, callback, asyncState);
                return _result;
            }
            
            public Top.Client.Components.DM.ServiceReference1.FullShopInfo EndGetFullShopInfoByNick(System.IAsyncResult result) {
                object[] _args = new object[0];
                Top.Client.Components.DM.ServiceReference1.FullShopInfo _result = ((Top.Client.Components.DM.ServiceReference1.FullShopInfo)(base.EndInvoke("GetFullShopInfoByNick", _args, result)));
                return _result;
            }
        }
    }
}
