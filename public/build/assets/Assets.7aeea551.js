import{r as l,u as m,a as C,o as u,c as k,w as A,b as e,l as v,m as q,t as n,s as B,F as N,k as b,e as _}from"./app.dc7518d1.js";import V from"./EditMember.1d33eb57.js";import $ from"./AssetForm.9c410f27.js";const w=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),x=e("br",null,null,-1),D={class:"table-responsive"},F={class:"table mb-0 table-borderless"},M=e("thead",null,[e("tr",null,[e("th",{scope:"col"},"Asset No."),e("th",{scope:"col"},"Title"),e("th",{scope:"col"},"Value"),e("th",{scope:"col"},"Val Date"),e("th",{scope:"col"},"Status"),e("th",{scope:"col"},"Action")])],-1),O=e("td",null,[e("div",{class:"badge badge-pill badge-success"},"Active")],-1),E={class:"flex align-items-center list-user-action"},S=["onClick"],L=e("i",{class:"ri-pencil-line"},null,-1),P=[L],R=["onClick"],T=e("i",{class:"ri-delete-bin-line"},null,-1),z=[T],K={name:"Assets",props:{member:Object,assets:Object},setup(o){const s=o;let i=l(),r=l("Create"),c=l(0);const d=l(m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:"",title:"",description:"",valuation_date:"",valued_by:"",valuer_phone:"",valuation_amount:"",location:"",registration_number:"",registered_to:"",condition:"",notes:""})),h=()=>{c.value=0,r.value="Create",d.value=m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:"",title:"",description:"",valuation_date:"",valued_by:"",valuer_phone:"",valuation_amount:"",location:"",registration_number:"",registered_to:"",condition:"",notes:""})},p=t=>{c.value=t.id,r.value="Edit",d.value=m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:t.asset_number,title:t.title,description:t.description,valuation_date:t.valuation_date,valued_by:t.valued_by,valuer_phone:t.valuer_phone,valuation_amount:t.valuation_amount,location:t.location,registration_number:t.registration_number,registered_to:t.asset_number,condition:t.asset_number,notes:t.asset_number})};return(t,G)=>{const g=C("Confirm");return u(),k(V,{member:o.member,title:"Member Assets"},{default:A(()=>[e("div",{class:"col-sm-12 my-3"},[e("div",{class:"user-list-files d-flex float-right mb-3"},[w,e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:h,href:"javascript:void();"}," New ")])]),x,e("div",D,[e("table",F,[M,e("tbody",null,[(u(!0),v(N,null,q(o.assets,(a,f)=>(u(),v("tr",{key:f},[e("td",null,n(a.asset_number),1),e("td",null,n(a.title),1),e("td",null,n(a.valuation_amount),1),e("td",null,n(a.valuation_date),1),O,e("td",null,[e("div",E,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:y=>p(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},P,8,S),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:y=>B(i)?i.value=t.route("assets.destroy",a.id):i=t.route("assets.destroy",a.id),"data-original-title":"Delete",href:"#confirm"},z,8,R)])])]))),128))])])]),b($,{form:d.value,action:_(r),item:_(c)},null,8,["form","action","item"]),b(g,{url:_(i)},null,8,["url"])]),_:1},8,["member"])}}};export{K as default};