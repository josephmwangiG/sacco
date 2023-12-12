import{r as i,u as d,a as u,o as s,c as g,w as y,b as e,l as n,F as k,m as A,t as l,e as o,k as _,i as x}from"./app.a9a0490e.js";import N from"./ApproveLoan.cf3886d6.js";import{f as w}from"./utils.7dce455c.js";const C={class:"row"},q={class:"col-sm-12"},L={class:"iq-card"},B={class:"iq-card-header d-flex justify-content-between"},F=e("div",{class:"iq-header-title"},[e("h4",{class:"card-title"},"Loan Pending Approval")],-1),M={class:"user-list-files d-flex float-right"},S=["href"],D={class:"iq-card-body"},O={key:0,class:"table-responsive"},P={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},V=e("thead",null,[e("tr",null,[e("th",null,"No."),e("th",null,"Member"),e("th",null,"Loan"),e("th",null,"Application Date"),e("th",null,"Interest"),e("th",null,"Amount"),e("th",null,"Service Fee"),e("th",null,"Action")])],-1),$={class:"flex align-items-center list-user-action"},E=["onClick"],I=e("i",{class:"ri-checkbox-circle-line"},null,-1),T=x(" Approve"),z=[I,T],G={key:1,class:"my-4"},U={name:"PendingApproval",props:{members:Object,loanApplications:Object},setup(r){let m=i(""),p=i(0),c=i(d({id:""}));const h=a=>{p.value=a.id,c.value=d({id:a.id})};return(a,H)=>{const f=u("Confirm"),v=u("Main");return s(),g(v,null,{default:y(()=>[e("div",C,[e("div",q,[e("div",L,[e("div",B,[F,e("div",M,[e("a",{class:"iq-bg-primary",href:a.route("pdf.loan.applications")}," Print ",8,S)])]),e("div",D,[r.loanApplications.length>0?(s(),n("div",O,[e("table",P,[V,e("tbody",null,[(s(!0),n(k,null,A(r.loanApplications,(t,b)=>(s(),n("tr",{key:b},[e("td",null,l(t.application_ref_number),1),e("td",null,l(t.member.user.first_name)+" "+l(t.member.user.last_name),1),e("td",null,l(t.loan_type.name),1),e("td",null,l(o(w)(t.application_date.substring(0,10))),1),e("td",null,l(t.interest_rate),1),e("td",null,l(Number(t.amount_applied).toLocaleString()),1),e("td",null,l(Number(t.service_fee).toLocaleString()),1),e("td",null,[e("div",$,[e("a",{style:{"white-space":"nowrap"},onClick:J=>h(t),"data-toggle":"modal",href:"#formModal"},z,8,E)])])]))),128))])])])):(s(),n("h5",G,"No items available"))])])])]),_(f,{url:o(m)},null,8,["url"]),_(N,{form:o(c)},null,8,["form"])]),_:1})}}};export{U as default};
