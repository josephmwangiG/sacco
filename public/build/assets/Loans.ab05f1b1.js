import{r as n,u as m,a as C,o as _,c as k,w as q,b as e,l as p,m as x,t as i,s as B,F as L,k as v,e as u}from"./app.234aa32e.js";import N from"./EditMember.3a4db9f1.js";import $ from"./AssetForm.7254bf65.js";const w=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ",-1),A=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Excel ",-1),D=e("a",{class:"iq-bg-primary",href:"javascript:void();"}," Pdf ",-1),E=e("br",null,null,-1),F={class:"table-responsive"},M={class:"table mb-0 table-borderless"},O=e("thead",null,[e("tr",null,[e("th",{scope:"col"},"Loan No."),e("th",{scope:"col"},"Loan Type"),e("th",{scope:"col"},"Start Date"),e("th",{scope:"col"},"Amount"),e("th",{scope:"col"},"Status"),e("th",{scope:"col"},"Action")])],-1),S=e("td",null,[e("div",{class:"badge badge-pill badge-success"},"Active")],-1),P={class:"flex align-items-center list-user-action"},V=["onClick"],R=e("i",{class:"ri-pencil-line"},null,-1),T=[R],z=["onClick"],G=e("i",{class:"ri-delete-bin-line"},null,-1),H=[G],U={name:"Loans",props:{member:Object,loans:Object},setup(l){const s=l;let o=n(),r=n("Create"),c=n(0);const d=n(m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:"",title:"",description:"",valuation_date:"",valued_by:"",valuer_phone:"",valuation_amount:"",location:"",registration_number:"",registered_to:"",condition:"",notes:""})),b=()=>{c.value=0,r.value="Create",d.value=m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:"",title:"",description:"",valuation_date:"",valued_by:"",valuer_phone:"",valuation_amount:"",location:"",registration_number:"",registered_to:"",condition:"",notes:""})},h=t=>{c.value=t.id,r.value="Edit",d.value=m({member_id:s.member.id,branch_id:s.member.branch_id,asset_number:t.asset_number,title:t.title,description:t.description,valuation_date:t.valuation_date,valued_by:t.valued_by,valuer_phone:t.valuer_phone,valuation_amount:t.valuation_amount,location:t.location,registration_number:t.registration_number,registered_to:t.asset_number,condition:t.asset_number,notes:t.asset_number})};return(t,I)=>{const f=C("Confirm");return _(),k(N,{member:l.member,title:"Member loans"},{default:q(()=>[e("div",{class:"col-sm-12 mb-3"},[e("div",{class:"user-list-files d-flex float-right"},[w,A,D,e("a",{class:"iq-bg-primary","data-toggle":"modal","data-target":"#formModal",onClick:b,href:"javascript:void();"}," New ")])]),E,e("div",F,[e("table",M,[O,e("tbody",null,[(_(!0),p(L,null,x(l.loans,(a,g)=>(_(),p("tr",{key:g},[e("td",null,i(a.loan_reference_number),1),e("td",null,i(a.loan_type.name),1),e("td",null,i(a.start_date),1),e("td",null,i(a.amount_approved),1),S,e("td",null,[e("div",P,[e("a",{class:"iq-bg-primary","data-placement":"top",onClick:y=>h(a),"data-toggle":"modal","data-target":"#formModal",href:"javascript:void();"},T,8,V),e("a",{class:"iq-bg-primary","data-toggle":"modal","data-placement":"top",onClick:y=>B(o)?o.value=t.route("loans.destroy",a.id):o=t.route("loans.destroy",a.id),"data-original-title":"Delete",href:"#confirm"},H,8,z)])])]))),128))])])]),v($,{form:d.value,action:u(r),item:u(c)},null,8,["form","action","item"]),v(f,{url:u(o)},null,8,["url"])]),_:1},8,["member"])}}};export{U as default};
