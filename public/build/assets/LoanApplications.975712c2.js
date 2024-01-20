import{r as c,u as w,q as S,a as u,o as a,c as x,w as y,b as e,f as M,v as N,e as r,s as g,l as n,m as k,t as s,k as p,n as D,F as q,x as T}from"./app.a9a0490e.js";import B from"./ApplicationForm.50c4536e.js";import{d as F}from"./debounce.559dd8f5.js";import{f as V}from"./utils.7dce455c.js";import"./_baseGetTag.7ab3fb4a.js";const j={class:"row"},I={class:"col-sm-12"},O={class:"iq-card"},P=e("div",{class:"iq-card-header d-flex justify-content-between"},[e("div",{class:"iq-header-title"},[e("h4",{class:"card-title"},"Loan Applications")])],-1),H={class:"iq-card-body"},R={class:"row justify-content-between"},E={class:"col-sm-12 col-md-5"},U={id:"user_list_datatable_info",class:"dataTables_filter"},$={class:"mr-3 position-relative"},z={class:"form-group mb-0"},G={class:"col-sm-12 col-md-7"},J={class:"user-list-files d-flex float-right"},K=["href"],Q={class:"table-responsive"},W={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},X=e("thead",null,[e("tr",null,[e("th",null,"No."),e("th",null,"Member"),e("th",null,"Loan"),e("th",null,"Application Date"),e("th",null,"Interest"),e("th",null,"Amount"),e("th",null,"Service Fee"),e("th",null,"Status"),e("th",null,"Action")])],-1),Y={key:0,class:"badge bg-success text-white dark-icon-light iq-bg-primary"},Z={key:1,class:"badge bg-danger text-white dark-icon-light iq-bg-primary"},ee={key:2,class:"badge bg-dark text-white dark-icon-light iq-bg-primary"},te={class:"flex align-items-center list-user-action"},se=e("i",{class:"ri-pencil-line"},null,-1),ae=e("i",{class:"ri-delete-bin-line"},null,-1),ne=[ae],ie={class:"row justify-content-between mt-3"},le={id:"user-list-page-info",class:"col-md-6"},oe={class:"col-md-6"},re={"aria-label":"Page navigation example"},ce={class:"pagination justify-content-end mb-0"},be={name:"LoanApplications",props:{members:Object,loanApplications:Object,filters:Object},setup(l){let o=c(l.filters.search),d=c(""),h=c("Create"),f=c(0),b=c(w({member:"",loan_officer:"",loan_type:"",reduce_principal_early:"",amount_applied:"",periodic_payment_amount:"",application_date:"",disburse_method:"",disburse_note:"",mpesa_number:"",mpesa_first_name:"",mpesa_middle_name:"",mpesa_last_name:"",cheque_number:"",bank_name:"",bank_branch:"",cheque_date:"",witness_type:"",witness_first_name:"",witness_last_name:"",witness_country:"",witness_county:"",witness_city:"",witness_national_id:"",witness_phone:"",witness_email:"",witness_postal_address:"",witness_residential_address:"",witnessed_by:"",reviewed_by:"",reviewed_on:"",approved_on:"",rejected_on:"",rejection_notes:"",attach_application_form:""}));const A=()=>{f.value=0,h.value="Create",b.value=w({member:"",loan_officer:"",loan_type:"",reduce_principal_early:"",amount_applied:"",periodic_payment_amount:"",application_date:"",disburse_method:"",disburse_note:"",mpesa_number:"",mpesa_first_name:"",mpesa_middle_name:"",mpesa_last_name:"",cheque_number:"",bank_name:"",bank_branch:"",cheque_date:"",witness_type:"",witness_first_name:"",witness_last_name:"",witness_country:"",witness_county:"",witness_city:"",witness_national_id:"",witness_phone:"",witness_email:"",witness_postal_address:"",witness_residential_address:"",witnessed_by:"",reviewed_by:"",reviewed_on:"",approved_on:"",rejected_on:"",rejection_notes:"",attach_application_form:""})};return S(o,F(i=>{T.Inertia.get(route("loanApplications.index"),{search:o.value},{preserveState:!0,replace:!0})},500)),(i,_)=>{const v=u("Link"),L=u("Confirm"),C=u("Main");return a(),x(C,null,{default:y(()=>[e("div",j,[e("div",I,[e("div",O,[P,e("div",H,[e("div",R,[e("div",E,[e("div",U,[e("form",$,[e("div",z,[M(e("input",{type:"search","onUpdate:modelValue":_[0]||(_[0]=t=>g(o)?o.value=t:o=t),class:"form-control",id:"exampleInputSearch",placeholder:"Search","aria-controls":"user-list-table"},null,512),[[N,r(o)]])])])])]),e("div",G,[e("div",J,[e("a",{class:"iq-bg-primary",href:i.route("pdf.loan.applications")}," Print ",8,K),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:A,href:"javascript:void();"}," New ")])])]),e("div",Q,[e("table",W,[X,e("tbody",null,[(a(!0),n(q,null,k(l.loanApplications.data,(t,m)=>(a(),n("tr",{key:m},[e("td",null,s(t.application_ref_number),1),e("td",null,s(t.user.first_name)+" "+s(t.user.last_name),1),e("td",null,s(t.loanType.name),1),e("td",null,s(r(V)(t.application_date.substring(0,10))),1),e("td",null,s(t.interest_rate),1),e("td",null,s(Number(t.amount_applied).toLocaleString()),1),e("td",null,s(Number(t.service_fee).toLocaleString()),1),e("td",null,[t.approved_on!=null?(a(),n("span",Y,"Approved")):t.rejected_on!=null?(a(),n("span",Z,"Rejected")):(a(),n("span",ee,"Pending"))]),e("td",null,[e("div",te,[p(v,{class:"iq-bg-primary",href:i.route("loanApplications.edit",t.id)},{default:y(()=>[se]),_:2},1032,["href"]),t.approved_on==null?(a(),n("a",{key:0,class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:_[1]||(_[1]=_e=>g(d)?d.value=i.route("loanApplications.destroy",i.member.id):d=i.route("loanApplications.destroy",i.member.id)),"data-original-title":"Delete",href:"#confirm"},ne)):D("",!0)])])]))),128))])])]),e("div",ie,[e("div",le,[e("span",null,"Showing 1 to "+s(l.loanApplications.total>10?"10":l.loanApplications.total)+" of "+s(l.loanApplications.total)+" entries",1)]),e("div",oe,[e("nav",re,[e("ul",ce,[(a(!0),n(q,null,k(l.loanApplications.links,(t,m)=>(a(),n("li",{class:"page-item active",key:m},[p(v,{class:"page-link",href:t.url,innerHTML:t.label},null,8,["href","innerHTML"])]))),128))])])])])])])])]),p(L,{url:r(d)},null,8,["url"]),p(B,{form:r(b),action:r(h),item:r(f)},null,8,["form","action","item"])]),_:1})}}};export{be as default};