import{r as i,u as m,a as v,o as c,c as y,w as g,b as e,l as o,m as k,t as l,s as q,F as C,k as L,e as A}from"./app.8c14ce0c.js";import N from"./EditApplication.82ea221c.js";import"./_baseGetTag.a7f6b3f0.js";const w=e("div",{class:"row justify-content-between"},[e("div",{class:"col-sm-5 col-md-4"},[e("h4",{class:"card-title"},"Payments")]),e("div",{class:"col-sm-7 col-md-6"},[e("div",{class:"user-list-files d-flex float-right"},[e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ")])])],-1),B={class:"table-responsive"},O={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},P=e("thead",null,[e("tr",null,[e("th",null,"Loan No."),e("th",null,"Member"),e("th",null,"Ac Number"),e("th",null,"Phone"),e("th",null,"Method"),e("th",null,"Amount"),e("th",null,"Status"),e("th",null,"Action")])],-1),x=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),F={class:"flex align-items-center list-user-action"},M=["onClick"],$=e("i",{class:"ri-pencil-line"},null,-1),D=[$],E=["onClick"],S=e("i",{class:"ri-delete-bin-line"},null,-1),V=[S],I={name:"Payments",props:{payments:Object,member:Object,activeLoan:Object,id:Number},setup(r){const n=r;let s=i(""),d=i("Add"),u=i(0),_=i(m({loan_id:n.activeLoan.id,member:n.member.id,amount:"",payment_method:"",payment_date:"",description:"",id_number:n.member.id_number,account_number:n.member.account.account_number,bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""}));const h=t=>{d.value="Edit",u.value=t.id,_.value=m({loan_id:n.activeLoan.id,member:t.member_id,amount:t.amount,id_number:n.member.id_number,account_number:n.member.account.account_number,payment_method:t.method_id,payment_date:t.payment_date,description:t.notes,bank_name:t.bank_name,bank_branch:t.bank_branch,cheque_date:t.cheque_date,cheque_number:t.cheque_number})};return(t,R)=>{const b=v("Confirm");return c(),y(N,{id:r.id,active:"payments"},{default:g(()=>[w,e("div",B,[e("table",O,[P,e("tbody",null,[(c(!0),o(C,null,k(r.payments,(a,p)=>(c(),o("tr",{key:p},[e("td",null,l(a.loan.loan_reference_number),1),e("td",null,l(a.member.user.first_name)+" "+l(a.member.user.last_name),1),e("td",null,l(a.member.account.account_number),1),e("td",null,l(a.member.phone),1),e("td",null,l(a.method_id),1),e("td",null,l(a.amount),1),x,e("td",null,[e("div",F,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:f=>h(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},D,8,M),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:f=>q(s)?s.value=t.route("activeLoans.delete.payments",a.id):s=t.route("activeLoans.delete.payments",a.id),"data-original-title":"Delete",href:"#confirm"},V,8,E)])])]))),128))])])]),L(b,{url:A(s)},null,8,["url"])]),_:1},8,["id"])}}};export{I as default};