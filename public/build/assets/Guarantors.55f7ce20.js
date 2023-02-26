import{j as C,r as i,u as _,a as A,o,c as q,w as N,b as e,l as h,p as w,m as x,t as s,s as B,F as E,k as p,e as c}from"./app.3bfe1e0a.js";import P from"./GuarantorsForm.91acfbb4.js";import $ from"./EditApplication.535364fa.js";import"./_baseGetTag.02f7d89e.js";const D={class:"row justify-content-between"},F=e("div",{class:"col-sm-5 col-md-4"},[e("h4",{class:"card-title"},"Guarantors")],-1),M={class:"col-sm-7 col-md-6"},O={class:"user-list-files d-flex float-right"},V=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),G=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),S=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),J={class:"table-responsive"},L={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},R=e("thead",null,[e("tr",null,[e("th",null,"Member"),e("th",null,"Ac Number"),e("th",null,"Amount"),e("th",null,"Address"),e("th",null,"Phone"),e("th",null,"Status"),e("th",null,"Join Date"),e("th",null,"Action")])],-1),z=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),H={class:"flex align-items-center list-user-action"},I=["onClick"],K=e("i",{class:"ri-pencil-line"},null,-1),Q=[K],T=["onClick"],U=e("i",{class:"ri-delete-bin-line"},null,-1),W=[U],ee={name:"Guarantors",props:{loanApplication:Object,guarantors:Object,id:Number},setup(n){const b=C().props.value.members;let l=i(""),d=i("Create"),m=i(0),u=i(_({member:"",notes:"",guarantee_amount:"",id_number:"",account_number:""}));const g=()=>{m.value=0,d.value="Create",u.value=_({member:"",notes:"",guarantee_amount:"",id_number:"",account_number:""})},f=a=>{d.value="Edit",m.value=a.id,b.forEach(r=>{r.id==a.member_id&&(u.value=_({id_number:r.id_number,account_number:r.account.account_number,member:a.member_id,notes:a.notes,guarantee_amount:a.guarantee_amount}))})};return(a,r)=>{const v=A("Confirm");return o(),q($,{id:n.id,active:"guarantors"},{default:N(()=>[e("div",D,[F,e("div",M,[e("div",O,[V,G,S,n.loanApplication.approved_on==null?(o(),h("a",{key:0,class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:g,href:"javascript:void();"}," New ")):w("",!0)])])]),e("div",J,[e("table",L,[R,e("tbody",null,[(o(!0),h(E,null,x(n.guarantors,(t,y)=>(o(),h("tr",{key:y},[e("td",null,s(t.member.first_name)+" "+s(t.member.last_name),1),e("td",null,s(t.member.account.account_number),1),e("td",null,s(t.guarantee_amount),1),e("td",null,s(t.member.residential_address),1),e("td",null,s(t.member.phone),1),z,e("td",null,s(t.member.date_became_member.substring(0,10)),1),e("td",null,[e("div",H,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:k=>f(t),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},Q,8,I),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:k=>B(l)?l.value=a.route("loanApplications.delete.guarantors",t.id):l=a.route("loanApplications.delete.guarantors",t.id),"data-original-title":"Delete",href:"#confirm"},W,8,T)])])]))),128))])])]),p(v,{url:c(l)},null,8,["url"]),p(P,{form:c(u),action:c(d),item:c(m),id:n.id},null,8,["form","action","item","id"])]),_:1},8,["id"])}}};export{ee as default};
