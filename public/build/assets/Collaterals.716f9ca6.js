import{r as n,u as p,a as y,o as c,c as k,w as q,b as t,l as v,p as N,m as w,t as s,s as x,F as B,k as h,e as r}from"./app.1732e059.js";import E from"./CollateralForm.00cdc456.js";import O from"./EditApplication.146b0291.js";import"./_baseGetTag.90041363.js";const V={class:"row justify-content-between"},$=t("div",{class:"col-sm-5 col-md-4"},[t("h4",{class:"card-title"},"Collaterals")],-1),z={class:"col-sm-7 col-md-6"},F={class:"user-list-files d-flex float-right"},D=t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),M=t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),P=t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),L={class:"table-responsive"},R={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},S=t("thead",null,[t("tr",null,[t("th",null,"Asset"),t("th",null,"Asset No."),t("th",null,"valuation Amt."),t("th",null,"Valuation date"),t("th",null,"Condition"),t("th",null,"Action")])],-1),G={class:"flex align-items-center list-user-action"},H=["onClick"],I=t("i",{class:"ri-pencil-line"},null,-1),J=[I],K=["onClick"],Q=t("i",{class:"ri-delete-bin-line"},null,-1),T=[Q],Z={name:"Collaterals",props:{collaterals:Object,assets:Object,loanApplication:Object,id:Number},setup(i){const a=i;console.log(a.collaterals);let o=n(""),d=n("Create"),u=n(0),m=n(p({loan_application_id:a.loanApplication.id,member_id:a.loanApplication.member_id,organization_id:a.loanApplication.id,asset_number:"",asset:"",valuation_date:"",valuation_amount:"",condition:""}));const f=()=>{u.value=0,d.value="Create",m.value=p({loan_application_id:a.loanApplication.id,member_id:a.loanApplication.member_id,organization_id:a.loanApplication.id,asset_number:"",asset:"",valuation_date:"",valuation_amount:"",condition:""})},g=e=>{d.value="Edit",u.value=e.id,a.assets.forEach(_=>{_.id==e.asset_id&&(m.value=p({loan_application_id:a.loanApplication.id,member_id:a.loanApplication.meber_id,organization_id:a.loanApplication.id,asset:_.id,asset_number:e.asset.asset_number,valuation_date:e.asset.valuation_date,valuation_amount:e.asset.valuation_amount,condition:e.asset.condition}))})};return(e,_)=>{const b=y("Confirm");return c(),k(O,{id:i.id,active:"collaterals"},{default:q(()=>[t("div",V,[$,t("div",z,[t("div",F,[D,M,P,i.loanApplication.approved_on==null?(c(),v("a",{key:0,class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:f,href:"javascript:void();"}," New ")):N("",!0)])])]),t("div",L,[t("table",R,[S,t("tbody",null,[(c(!0),v(B,null,w(i.collaterals,(l,A)=>(c(),v("tr",{key:A},[t("td",null,s(l.asset.title),1),t("td",null,s(l.asset.asset_number),1),t("td",null,s(l.asset.valuation_amount),1),t("td",null,s(l.asset.valuation_date),1),t("td",null,s(l.asset.condition),1),t("td",null,[t("div",G,[t("a",{class:"iq-bg-primary","data-placement":"top",onClick:C=>g(l),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},J,8,H),t("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:C=>x(o)?o.value=e.route("loanApplications.delete.collaterals",l.id):o=e.route("loanApplications.delete.collaterals",l.id),"data-original-title":"Delete",href:"#confirm"},T,8,K)])])]))),128))])])]),h(b,{url:r(o)},null,8,["url"]),h(E,{assets:i.assets,form:r(m),action:r(d),item:r(u),id:i.id},null,8,["assets","form","action","item","id"])]),_:1},8,["id"])}}};export{Z as default};
