import{a as p,o as i,c as o,w as l,b as t,k as b,z as n,e as c,j as r,p as u,A as f,i as d}from"./app.8c14ce0c.js";const _={class:"row"},A={class:"col-sm-12 col-lg-12"},m={class:"iq-card"},v=t("div",{class:"iq-card-header d-flex justify-content-between"},[t("div",{class:"iq-header-title"},[t("h4",{class:"card-title"},"Loan Application")])],-1),y={class:"iq-card-body"},k={class:"items-tabs"},j={class:"d-flex justify-content-between"},w={class:"tabs-menu",style:{"overflow-y":"hidden"}},z=t("i",{class:"ri-list-settings-line pr-1",style:{"font-size":"20px"}},null,-1),W=d(" Details"),g=[z,W],C=t("i",{class:"ri-ball-pen-fill pr-1",style:{"font-size":"20px"}},null,-1),x=d(" Witness"),N=[C,x],q=t("i",{class:"ri-safe-fill pr-1",style:{"font-size":"20px"}},null,-1),V=d(" Guarantors"),B=[q,V],L=t("i",{class:"ri-refund-fill pr-1",style:{"font-size":"20px"}},null,-1),D=d(" Collateral"),M=[L,D],S=t("i",{class:"ri-send-plane-fill pr-1",style:{"font-size":"20px"}},null,-1),E=d(" Disbursement"),G=[S,E],P=t("i",{class:"ri-check-double-line pr-1",style:{"font-size":"20px"}},null,-1),R=d(" Confirm"),T=[P,R],$=t("i",{class:"ri-close-line pr-1",style:{"font-size":"20px"}},null,-1),F=d(" Reject"),H=[$,F],I=t("div",{class:"tab-content-wrapper pt-0 mt-0 mb-3"},null,-1),O={name:"EditApplication",props:{loanApplication:Number,active:String},setup(e){return(s,J)=>{const a=p("Link"),h=p("Main");return i(),o(h,null,{default:l(()=>[t("div",_,[t("div",A,[t("div",m,[v,t("div",y,[t("div",k,[t("div",j,[t("div",w,[b(a,{class:"tab",href:s.route("u.loanApplications.edit",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/applications/"+e.loanApplication.id)?"active-tab":""])},g,2)]),_:1},8,["href"]),e.loanApplication.rejected_on==null?(i(),o(a,{key:0,class:"tab",href:s.route("u.loanApplications.witness",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/witness")?"active-tab":""])},N,2)]),_:1},8,["href"])):u("",!0),e.loanApplication.rejected_on==null?(i(),o(a,{key:1,class:"tab",href:s.route("u.loanApplications.guarantors",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/guarantors")?"active-tab":""])},B,2)]),_:1},8,["href"])):u("",!0),e.loanApplication.rejected_on==null?(i(),o(a,{key:2,class:"tab",href:s.route("u.loanApplications.collaterals",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/collaterals")?"active-tab":""])},M,2)]),_:1},8,["href"])):u("",!0),e.loanApplication.approved_on!=null?(i(),o(a,{key:3,class:"tab",href:s.route("u.loanApplications.disbursement",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/disbursement")?"active-tab":""])},G,2)]),_:1},8,["href"])):u("",!0),e.loanApplication.approved_on!=null?(i(),o(a,{key:4,class:"tab",href:s.route("u.loanApplications.confirm",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/confirm")?"active-tab":""])},T,2)]),_:1},8,["href"])):u("",!0),e.loanApplication.rejected_on!=null?(i(),o(a,{key:5,class:"tab",href:s.route("u.loanApplications.reject",e.loanApplication.id)},{default:l(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/u/loanApplications/reject")?"active-tab":""])},H,2)]),_:1},8,["href"])):u("",!0)])]),I]),f(s.$slots,"default")])])])])]),_:3})}}};export{O as default};
