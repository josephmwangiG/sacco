import{j as L,r as n,u as p,q as B,a as v,o as r,c as D,w as P,b as e,f as T,v as E,e as o,s as w,l as c,m as g,t as s,F as k,k as b,x as F}from"./app.3bfe1e0a.js";import I from"./WithdrawalForm.2bf182ce.js";import{d as N}from"./debounce.c7cd0eea.js";import"./_baseGetTag.02f7d89e.js";const V={class:"row"},W={class:"col-sm-12"},H={class:"iq-card"},O=e("div",{class:"iq-card-header d-flex justify-content-between"},[e("div",{class:"iq-header-title"},[e("h4",{class:"card-title"},"Withdrawals")])],-1),R={class:"iq-card-body"},$={class:"row justify-content-between"},U={class:"col-sm-12 col-md-5"},z={id:"user_list_datatable_info",class:"dataTables_filter"},G={class:"mr-3 position-relative"},J={class:"form-group mb-0"},K=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),Q=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),X=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),Y={class:"table-responsive"},Z={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},j=e("thead",null,[e("tr",null,[e("th",null,"Receipt"),e("th",null,"Member"),e("th",null,"Withdrawal Date"),e("th",null,"Method"),e("th",null,"Amount"),e("th",null,"Status"),e("th",null,"Action")])],-1),ee=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),te={class:"flex align-items-center list-user-action"},ae=["onClick"],se=e("i",{class:"ri-pencil-line"},null,-1),le=[se],ie=["onClick"],ne=e("i",{class:"ri-delete-bin-line"},null,-1),re=[ne],oe={class:"row justify-content-between mt-3"},de={id:"user-list-page-info",class:"col-md-6"},ce={class:"col-md-6"},me={"aria-label":"Page navigation example"},ue={class:"pagination justify-content-end mb-0"},be={name:"Withdrawals",props:{withdrawals:Object,filters:Object},setup(l){const y=l;L().props.value.members;let i=n(y.filters.search),d=n(""),m=n("Add"),u=n(0),_=n(p({member:"",amount:"",payment_method:"",withdrawal_date:"",description:"",account_number:"",id_number:"",bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""}));const q=()=>{u.value=0,m.value="Add",_.value=p({member:"",amount:"",payment_method:"",withdrawal_date:"",description:"",account_number:"",id_number:"",bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""})},x=t=>{m.value="Edit",u.value=t.id,_.value=p({member:t.member_id,amount:t.amount,id_number:t.member.id_number,account_number:t.account.account_number,payment_method:t.method_id,withdrawal_date:t.withdrawal_date,description:t.notes,bank_name:t.bank_name,bank_branch:t.bank_branch,cheque_date:t.cheque_date,cheque_number:t.cheque_number})};return B(i,N(t=>{F.Inertia.get(route("withdrawals.index"),{search:i.value},{preserveState:!0,replace:!0})},500)),(t,f)=>{const C=v("Link"),M=v("Confirm"),S=v("Main");return r(),D(S,null,{default:P(()=>[e("div",V,[e("div",W,[e("div",H,[O,e("div",R,[e("div",$,[e("div",U,[e("div",z,[e("form",G,[e("div",J,[T(e("input",{type:"search","onUpdate:modelValue":f[0]||(f[0]=a=>w(i)?i.value=a:i=a),class:"form-control",id:"exampleInputSearch",placeholder:"Search","aria-controls":"user-list-table"},null,512),[[E,o(i)]])])])])]),e("div",{class:"col-sm-12 col-md-7"},[e("div",{class:"user-list-files d-flex float-right"},[K,Q,X,e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:q,href:"javascript:void();"}," New ")])])]),e("div",Y,[e("table",Z,[j,e("tbody",null,[(r(!0),c(k,null,g(l.withdrawals.data,(a,h)=>(r(),c("tr",{key:h},[e("td",null,s(a.withdrawal_number),1),e("td",null,s(a.member.first_name)+" "+s(a.member.last_name),1),e("td",null,s(a.withdrawal_date),1),e("td",null,s(a.method_id),1),e("td",null,s(a.amount),1),ee,e("td",null,[e("div",te,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:A=>x(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},le,8,ae),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:A=>w(d)?d.value=t.route("withdrawals.destroy",a.id):d=t.route("withdrawals.destroy",a.id),"data-original-title":"Delete",href:"#confirm"},re,8,ie)])])]))),128))])])]),e("div",oe,[e("div",de,[e("span",null,"Showing 1 to "+s(l.withdrawals.total>10?"10":l.withdrawals.total)+" of "+s(l.withdrawals.total)+" entries",1)]),e("div",ce,[e("nav",me,[e("ul",ue,[(r(!0),c(k,null,g(l.withdrawals.links,(a,h)=>(r(),c("li",{class:"page-item active",key:h},[b(C,{class:"page-link",href:a.url,innerHTML:a.label},null,8,["href","innerHTML"])]))),128))])])])])])])])]),b(M,{url:o(d)},null,8,["url"]),b(I,{form:o(_),action:o(m),item:o(u)},null,8,["form","action","item"])]),_:1})}}};export{be as default};