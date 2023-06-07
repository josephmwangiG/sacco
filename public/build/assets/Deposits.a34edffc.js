import{j as L,r as o,u as f,q as B,a as b,o as r,c as P,w as T,b as e,f as F,v as I,e as d,s as g,l as m,m as y,t as a,F as k,k as v,x as N}from"./app.7d06a11a.js";import V from"./DepositForm.222d8079.js";import{d as E}from"./debounce.7d101e2c.js";import"./_baseGetTag.480645f0.js";const H={class:"row"},O={class:"col-sm-12"},R={class:"iq-card"},$=e("div",{class:"iq-card-header d-flex justify-content-between"},[e("div",{class:"iq-header-title"},[e("h4",{class:"card-title"},"Deposits")])],-1),U={class:"iq-card-body"},z={class:"row justify-content-between"},G={class:"col-sm-12 col-md-5"},J={id:"user_list_datatable_info",class:"dataTables_filter"},K={class:"mr-3 position-relative"},Q={class:"form-group mb-0"},W={class:"col-sm-12 col-md-7"},X={class:"user-list-files d-flex float-right"},Y=["href"],Z={class:"table-responsive"},j={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},ee=e("thead",null,[e("tr",null,[e("th",null,"Receipt"),e("th",null,"Member"),e("th",null,"Payment Date"),e("th",null,"Method"),e("th",null,"Amount"),e("th",null,"Status"),e("th",null,"Action")])],-1),te=e("td",null,[e("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),se={class:"flex align-items-center list-user-action"},ae=["onClick"],ne=e("i",{class:"ri-pencil-line"},null,-1),ie=[ne],le=["onClick"],oe=e("i",{class:"ri-delete-bin-line"},null,-1),re=[oe],de={class:"row justify-content-between mt-3"},ce={id:"user-list-page-info",class:"col-md-6"},me={class:"col-md-6"},ue={"aria-label":"Page navigation example"},_e={class:"pagination justify-content-end mb-0"},ve={name:"Deposits",props:{deposits:Object,filters:Object},setup(n){const q=n,w=L().props.value.members;let i=o(q.filters.search),c=o(""),u=o("Add"),_=o(0),h=o(f({member:"",amount:"",payment_method:"",payment_date:"",description:"",account_number:"",id_number:"",bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""}));const C=()=>{_.value=0,u.value="Add",h.value=f({member:"",amount:"",payment_method:"",payment_date:"",description:"",account_number:"",id_number:"",bank_name:"",bank_branch:"",cheque_date:"",cheque_number:""})},M=t=>{u.value="Edit",_.value=t.id,w.filter(l=>{if(t.member_id==l.id&&t.id)return l}),h.value=f({member:t.member_id,amount:t.amount,id_number:t.member.id_number,account_number:t.member.account.account_number,payment_method:t.method_id,payment_date:t.payment_date,description:t.notes,bank_name:t.bank_name,bank_branch:t.bank_branch,cheque_date:t.cheque_date,cheque_number:t.cheque_number})};return B(i,E(t=>{N.Inertia.get(route("deposits.index"),{search:i.value},{preserveState:!0,replace:!0})},500)),(t,l)=>{const x=b("Link"),D=b("Confirm"),S=b("Main");return r(),P(S,null,{default:T(()=>[e("div",H,[e("div",O,[e("div",R,[$,e("div",U,[e("div",z,[e("div",G,[e("div",J,[e("form",K,[e("div",Q,[F(e("input",{type:"search","onUpdate:modelValue":l[0]||(l[0]=s=>g(i)?i.value=s:i=s),class:"form-control",id:"exampleInputSearch",placeholder:"Search","aria-controls":"user-list-table"},null,512),[[I,d(i)]])])])])]),e("div",W,[e("div",X,[e("a",{class:"iq-bg-primary",href:t.route("pdf.deposits")}," Print ",8,Y),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:C,href:"javascript:void();"}," New ")])])]),e("div",Z,[e("table",j,[ee,e("tbody",null,[(r(!0),m(k,null,y(n.deposits.data,(s,p)=>(r(),m("tr",{key:p},[e("td",null,a(s.receipt_number),1),e("td",null,a(s.member.user.first_name)+" "+a(s.member.user.last_name),1),e("td",null,a(s.payment_date),1),e("td",null,a(s.method_id),1),e("td",null,a(s.amount),1),te,e("td",null,[e("div",se,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:A=>M(s),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},ie,8,ae),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:A=>g(c)?c.value=t.route("deposits.destroy",s.id):c=t.route("deposits.destroy",s.id),"data-original-title":"Delete",href:"#confirm"},re,8,le)])])]))),128))])])]),e("div",de,[e("div",ce,[e("span",null,"Showing 1 to "+a(n.deposits.total>10?"10":n.deposits.total)+" of "+a(n.deposits.total)+" entries",1)]),e("div",me,[e("nav",ue,[e("ul",_e,[(r(!0),m(k,null,y(n.deposits.links,(s,p)=>(r(),m("li",{class:"page-item active",key:p},[v(x,{class:"page-link",href:s.url,innerHTML:s.label},null,8,["href","innerHTML"])]))),128))])])])])])])])]),v(D,{url:d(c)},null,8,["url"]),v(V,{form:d(h),action:d(u),item:d(_)},null,8,["form","action","item"])]),_:1})}}};export{ve as default};
