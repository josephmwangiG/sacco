import{r as i,u as c,a as b,o as r,c as g,w as C,b as t,l as d,m as L,t as l,F as k,k as y,e as x}from"./app.a9a0490e.js";import w from"./EditApplication.6acea3d1.js";import"./_baseGetTag.7ab3fb4a.js";const z=t("div",{class:"row justify-content-between"},[t("div",{class:"col-sm-5 col-md-4"},[t("h4",{class:"card-title"},"Collaterals")]),t("div",{class:"col-sm-7 col-md-6"},[t("div",{class:"user-list-files d-flex float-right"},[t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ")])])],-1),A={class:"table-responsive"},B={id:"user-list-table",class:"table table-striped table-borderless mt-2",role:"grid","aria-describedby":"user-list-page-info"},N=t("thead",null,[t("tr",null,[t("th",null,"Asset"),t("th",null,"Asset No."),t("th",null,"valuation Amt."),t("th",null,"Valuation date"),t("th",null,"Condition"),t("th",null,"Action")])],-1),O={class:"flex align-items-center list-user-action"},E=["onClick"],F=t("i",{class:"ri-pencil-line"},null,-1),V=[F],P={name:"Collaterals",props:{collaterals:Object,activeLoan:Object,assets:Object,id:Number},setup(n){const a=n;console.log(a.collaterals);let u=i(""),_=i("Create"),m=i(0),v=i(c({loan_application_id:a.activeLoan.loan_application_id,member_id:a.activeLoan.member_id,organization_id:a.activeLoan.organization_id,asset_number:"",asset:"",valuation_date:"",valuation_amount:"",condition:""}));const p=e=>{_.value="Edit",m.value=e.id,a.assets.forEach(o=>{o.id==e.asset_id&&(v.value=c({loan_application_id:a.activeLoan.id,member_id:a.activeLoan.meber_id,organization_id:a.activeLoan.organization_id,asset:o.id,asset_number:e.asset.asset_number,valuation_date:e.asset.valuation_date,valuation_amount:e.asset.valuation_amount,condition:e.asset.condition}))})};return(e,o)=>{const f=b("Confirm");return r(),g(w,{id:n.id,active:"collaterals"},{default:C(()=>[z,t("div",A,[t("table",B,[N,t("tbody",null,[(r(!0),d(k,null,L(n.collaterals,(s,h)=>(r(),d("tr",{key:h},[t("td",null,l(s.asset.title),1),t("td",null,l(s.asset.asset_number),1),t("td",null,l(s.asset.valuation_amount),1),t("td",null,l(s.asset.valuation_date),1),t("td",null,l(s.asset.condition),1),t("td",null,[t("div",O,[t("a",{class:"iq-bg-primary","data-placement":"top",onClick:q=>p(s),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},V,8,E)])])]))),128))])])]),y(f,{url:x(u)},null,8,["url"])]),_:1},8,["id"])}}};export{P as default};