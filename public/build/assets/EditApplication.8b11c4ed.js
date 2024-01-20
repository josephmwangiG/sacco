import{a as u,o as i,c as o,w as s,b as t,k as b,z as n,e as c,j as r,n as p,A as f,i as d}from"./app.a9a0490e.js";const _={class:"row"},A={class:"col-sm-12 col-lg-12"},v={class:"iq-card"},m=t("div",{class:"iq-card-header d-flex justify-content-between"},[t("div",{class:"iq-header-title"},[t("h4",{class:"card-title"},"Loan Application")])],-1),y={class:"iq-card-body"},j=t("hr",{class:"mt-0"},null,-1),k={class:"items-tabs"},z={class:"d-flex justify-content-between"},w={class:"tabs-menu",style:{"overflow-y":"hidden"}},W=t("i",{class:"ri-list-settings-line pr-1",style:{"font-size":"20px"}},null,-1),g=d(" Details"),C=[W,g],x=t("i",{class:"ri-ball-pen-fill pr-1",style:{"font-size":"20px"}},null,-1),q=d(" Witness"),L=[x,q],N=t("i",{class:"ri-safe-fill pr-1",style:{"font-size":"20px"}},null,-1),V=d(" Guarantors"),B=[N,V],D=t("i",{class:"ri-refund-fill pr-1",style:{"font-size":"20px"}},null,-1),M=d(" Loan Approval"),S=[D,M],E=t("i",{class:"ri-refund-fill pr-1",style:{"font-size":"20px"}},null,-1),G=d(" Collateral"),O=[E,G],P=t("i",{class:"ri-send-plane-fill pr-1",style:{"font-size":"20px"}},null,-1),R=d(" Disbursement"),T=[P,R],$=t("i",{class:"ri-check-double-line pr-1",style:{"font-size":"20px"}},null,-1),F=d(" Confirm"),H=[$,F],I=t("i",{class:"ri-close-line pr-1",style:{"font-size":"20px"}},null,-1),J=d(" Reject"),K=[I,J],Q=t("div",{class:"tab-content-wrapper pt-0 mt-0 mb-3"},null,-1),Y={name:"EditApplication",props:{loanApplication:Object,active:String},setup(l){return(e,U)=>{const a=u("Link"),h=u("Main");return i(),o(h,null,{default:s(()=>[t("div",_,[t("div",A,[t("div",v,[m,t("div",y,[j,t("div",k,[t("div",z,[t("div",w,[b(a,{class:"tab",href:e.route("loanApplications.edit",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/"+l.loanApplication.id)?"active-tab":""])},C,2)]),_:1},8,["href"]),l.loanApplication.rejected_on==null?(i(),o(a,{key:0,class:"tab",href:e.route("loanApplications.witness",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/witness")?"active-tab":""])},L,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.rejected_on==null?(i(),o(a,{key:1,class:"tab",href:e.route("loanApplications.guarantors",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/guarantors")?"active-tab":""])},B,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.rejected_on==null?(i(),o(a,{key:2,class:"tab",href:e.route("loanApplications.approval",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/approval")?"active-tab":""])},S,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.rejected_on==null?(i(),o(a,{key:3,class:"tab",href:e.route("loanApplications.collaterals",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0 collapse",c(r)().url.value.startsWith("/loanApplications/collaterals")?"active-tab":""])},O,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.rejected_on==null?(i(),o(a,{key:4,class:"tab",href:e.route("loanApplications.disbursement",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/disbursement")?"active-tab":""])},T,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.rejected_on==null?(i(),o(a,{key:5,class:"tab",href:e.route("loanApplications.confirm",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/confirm")?"active-tab":""])},H,2)]),_:1},8,["href"])):p("",!0),l.loanApplication.approved_on==null?(i(),o(a,{key:6,class:"tab",href:e.route("loanApplications.reject",l.loanApplication.id)},{default:s(()=>[t("label",{class:n(["pb-0 mb-0",c(r)().url.value.startsWith("/loanApplications/reject")?"active-tab":""])},K,2)]),_:1},8,["href"])):p("",!0)])]),Q]),f(e.$slots,"default")])])])])]),_:3})}}};export{Y as default};