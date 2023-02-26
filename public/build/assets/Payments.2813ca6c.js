import{r as m,u,a as k,o as _,c as q,w as C,b as e,l as b,m as L,t as i,s as A,F as N,k as h,e as s}from"./app.3bfe1e0a.js";import w from"./PaymentForm.2a2ec862.js";import M from"./EditApplication.e0d17179.js";import"./_baseGetTag.02f7d89e.js";const x=e("div",{class:"col-sm-5 col-md-4"},[e("h4",{class:"card-title"},"payments")],-1),B=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),D=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),O=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),P={class:"table-responsive"},$={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},E=e("thead",null,[e("tr",null,[e("th",null,"Loan No."),e("th",null,"Member"),e("th",null,"Ac Number"),e("th",null,"Phone"),e("th",null,"Method"),e("th",null,"Amount"),e("th",null,"Status"),e("th",null,"Action")])],-1),F=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),S={class:"flex align-items-center list-user-action"},V=["onClick"],R=e("i",{class:"ri-pencil-line"},null,-1),z=[R],G=["onClick"],H=e("i",{class:"ri-delete-bin-line"},null,-1),I=[H],W={name:"Payments",props:{payments:Object,member:Object,activeLoan:Object,id:Number},setup(l){const a=l;let r=m(""),c=m("Add"),o=m(0),d=m(u({loan_id:a.activeLoan.id,member:a.member.id,amount:"",payment_method:"",payment_date:"",description:"",id_number:a.member.id_number,account_number:a.member.account.account_number,bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""}));const p=()=>{o.value=0,c.value="Add",d.value=u({loan_id:a.activeLoan.id,member:a.member.id,amount:"",payment_method:"",payment_date:"",description:"",id_number:a.member.id_number,account_number:a.member.account.account_number,bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""})},v=t=>{c.value="Edit",o.value=t.id,d.value=u({loan_id:a.activeLoan.id,member:t.member_id,amount:t.amount,id_number:a.member.id_number,account_number:a.member.account.account_number,payment_method:t.method_id,payment_date:t.payment_date,description:t.notes,bank_name:t.bank_name,bank_branch:t.bank_branch,cheque_date:t.cheque_date,cheque_number:t.cheque_number})};return(t,J)=>{const f=k("Confirm");return _(),q(M,{id:l.id,active:"payments"},{default:C(()=>[e("div",{class:"row justify-content-between"},[x,e("div",{class:"col-sm-7 col-md-6"},[e("div",{class:"user-list-files d-flex float-right"},[B,D,O,e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:p,href:"javascript:void();"}," New ")])])]),e("div",P,[e("table",$,[E,e("tbody",null,[(_(!0),b(N,null,L(l.payments,(n,y)=>(_(),b("tr",{key:y},[e("td",null,i(n.loan.loan_reference_number),1),e("td",null,i(n.member.first_name)+" "+i(n.member.last_name),1),e("td",null,i(n.member.account.account_number),1),e("td",null,i(n.member.phone),1),e("td",null,i(n.method_id),1),e("td",null,i(n.amount),1),F,e("td",null,[e("div",S,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:g=>v(n),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},z,8,V),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:g=>A(r)?r.value=t.route("activeLoans.delete.payments",n.id):r=t.route("activeLoans.delete.payments",n.id),"data-original-title":"Delete",href:"#confirm"},I,8,G)])])]))),128))])])]),h(f,{url:s(r)},null,8,["url"]),h(w,{hasMember:!0,memberDetails:l.member,form:s(d),action:s(c),item:s(o)},null,8,["memberDetails","form","action","item"])]),_:1},8,["id"])}}};export{W as default};
