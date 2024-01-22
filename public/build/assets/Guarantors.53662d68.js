import{j as C,r,u as p,a as N,o as s,c as w,w as S,b as e,l as c,n as h,t as n,m as q,s as x,F as B,k as b,e as u}from"./app.24fde918.js";import $ from"./GuarantorsForm.049ccbe1.js";import D from"./EditApplication.50170ffc.js";import"./_baseGetTag.7464d959.js";const E={class:"row justify-content-between"},F=e("div",{class:"col-sm-5 col-md-4"},[e("h4",{class:"card-title"},"Guarantors")],-1),M={class:"col-sm-7 col-md-6"},O={class:"user-list-files d-flex float-right"},P=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),V={key:0,class:"col-12 my-2"},G={class:"text-danger"},J={class:"table-responsive"},L={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},R=e("thead",null,[e("tr",null,[e("th",null,"Member"),e("th",null,"Ac Number"),e("th",null,"Amount"),e("th",null,"Address"),e("th",null,"Phone"),e("th",null,"Status"),e("th",null,"Join Date"),e("th",null,"Action")])],-1),T=e("td",null,[e("span",{class:"active"},"Active")],-1),z={class:"flex align-items-center list-user-action"},H=["onClick"],I=e("i",{class:"ri-pencil-line"},null,-1),K=[I],Q=["onClick"],U=e("i",{class:"ri-delete-bin-line"},null,-1),W=[U],te={name:"Guarantors",props:{loanApplication:Object,guarantors:Object,totalSum:Number,id:Number},setup(t){console.log(t.guarantors);const g=C().props.value.members;let o=r(""),m=r("Create"),d=r(0),_=r(p({member:"",notes:"",guarantee_amount:"",id_number:"",account_number:""}));const f=()=>{d.value=0,m.value="Create",_.value=p({member:"",notes:"",guarantee_amount:"",id_number:"",account_number:""})},v=l=>{m.value="Edit",d.value=l.id,g.forEach(i=>{i.id==l.member_id&&(_.value=p({id_number:i.id_number,account_number:i.account.account_number,member:l.member_id,notes:l.notes,guarantee_amount:l.guarantee_amount}))})};return(l,i)=>{const A=N("Confirm");return s(),w(D,{loanApplication:t.loanApplication,active:"guarantors"},{default:S(()=>[e("div",E,[F,e("div",M,[e("div",O,[P,t.loanApplication.approved_on==null?(s(),c("a",{key:0,class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:f,href:"javascript:void();"}," New ")):h("",!0)])]),t.loanApplication.amount_applied>t.totalSum?(s(),c("div",V,[e("span",G,"The guaranteed amount of "+n(t.totalSum)+" is less than "+n(t.loanApplication.amount_applied)+" applied.",1)])):h("",!0)]),e("div",J,[e("table",L,[R,e("tbody",null,[(s(!0),c(B,null,q(t.guarantors,(a,k)=>(s(),c("tr",{key:k},[e("td",null,n(a.member.user.first_name)+" "+n(a.member.user.last_name),1),e("td",null,n(a.member.account.account_number),1),e("td",null,n(a.guarantee_amount),1),e("td",null,n(a.member.user.residential_address),1),e("td",null,n(a.member.user.phone),1),T,e("td",null,n(a.member.date_became_member.substring(0,10)),1),e("td",null,[e("div",z,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:y=>v(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},K,8,H),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:y=>x(o)?o.value=l.route("loanApplications.delete.guarantors",a.id):o=l.route("loanApplications.delete.guarantors",a.id),"data-original-title":"Delete",href:"#confirm"},W,8,Q)])])]))),128))])])]),b(A,{url:u(o)},null,8,["url"]),b($,{form:u(_),action:u(m),item:u(d),id:t.id,m_id:t.loanApplication.member_id},null,8,["form","action","item","id","m_id"])]),_:1},8,["loanApplication"])}}};export{te as default};