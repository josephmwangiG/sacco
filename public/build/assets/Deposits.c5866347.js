import{r as s,u as _,a as q,o as b,c as C,w as D,b as e,l as h,m as A,t as l,s as M,F as x,k as p,e as m}from"./app.3bfe1e0a.js";import B from"./EditMember.80c97904.js";import $ from"./DepositForm.d81880e7.js";const w=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),E=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),F=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),N=e("br",null,null,-1),P={class:"table-responsive"},O={id:"user-list-table",class:"table table-striped table-borderless",role:"grid","aria-describedby":"user-list-page-info"},R=e("thead",null,[e("tr",null,[e("th",null,"Receipt"),e("th",null,"Payment Date"),e("th",null,"Method"),e("th",null,"Amount"),e("th",null,"Status"),e("th",null,"Action")])],-1),S=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),V={class:"flex align-items-center list-user-action"},I=["onClick"],L=e("i",{class:"ri-pencil-line"},null,-1),z=[L],G=["onClick"],H=e("i",{class:"ri-delete-bin-line"},null,-1),J=[H],U={name:"Deposits",props:{deposits:Object,member:Object},setup(r){const n=r;let i=s(""),o=s("Add"),c=s(0),d=s(_({member:n.member.id,amount:"",payment_method:"",payment_date:"",description:"",id_number:n.member.id_number,account_number:n.member.account.account_number,bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""}));const f=()=>{c.value=0,o.value="Add",d.value=_({member:n.member.id,amount:"",payment_method:"",payment_date:"",description:"",id_number:n.member.id_number,account_number:n.member.account.account_number,bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""})},v=t=>{o.value="Edit",c.value=t.id,members.filter(u=>{if(t.member_id==u.id&&t.id)return u}),d.value=_({member:t.member_id,amount:t.amount,id_number:t.id_number,account_number:t.account.account_number,payment_method:t.method_id,payment_date:t.payment_date,description:t.notes,bank_name:t.bank_name,bank_branch:t.bank_branch,cheque_date:t.cheque_date,cheque_number:t.cheque_number})};return(t,u)=>{const g=q("Confirm");return b(),C(B,{member:r.member,title:"Member Deposits"},{default:D(()=>[e("div",{class:"col-sm-12 mb-3"},[e("div",{class:"user-list-files d-flex float-right"},[w,E,F,e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:f,href:"javascript:void();"}," New ")])]),N,e("div",P,[e("table",O,[R,e("tbody",null,[(b(!0),h(x,null,A(r.deposits,(a,y)=>(b(),h("tr",{key:y},[e("td",null,l(a.receipt_number),1),e("td",null,l(a.payment_date),1),e("td",null,l(a.method_id),1),e("td",null,l(a.amount),1),S,e("td",null,[e("div",V,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:k=>v(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},z,8,I),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:k=>M(i)?i.value=t.route("deposits.destroy",a.id):i=t.route("deposits.destroy",a.id),"data-original-title":"Delete",href:"#confirm"},J,8,G)])])]))),128))])])]),p($,{hasMember:!0,memberDetails:r.member,form:m(d),action:m(o),item:m(c)},null,8,["memberDetails","form","action","item"]),p(g,{url:m(i)},null,8,["url"])]),_:1},8,["member"])}}};export{U as default};