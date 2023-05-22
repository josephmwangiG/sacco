import n from"./Statistics.9d42a3d0.js";import{a as r,o as a,c as h,w as _,b as s,t as e,k as b,l,m as u,F as m,i as c}from"./app.234aa32e.js";const p={class:"row"},v={class:"col-sm-6 col-md-6 col-lg-3"},g={class:"iq-card iq-card-block iq-card-stretch iq-card-height",style:{"border-radius":"0px"}},q={class:"iq-card-body"},f={class:"d-flex align-items-center justify-content-between text-right"},w=s("div",{class:"icon iq-icon-box rounded-circle bg-success"},[s("i",{class:"fa fa-users","aria-hidden":"true"})],-1),x=s("h5",{class:"mb-0"},"Members",-1),y={class:"h5 text-success mb-0 counter d-inline-block w-100"},k={class:"col-sm-6 col-md-6 col-lg-3"},S={class:"iq-card iq-card-block iq-card-stretch iq-card-height",style:{"border-radius":"0px"}},O={class:"iq-card-body iq-box-relative"},j={class:"d-flex align-items-center justify-content-between text-right"},B=s("div",{class:"icon iq-icon-box rounded-circle bg-warning"},[s("i",{class:"fa fa-handshake-o","aria-hidden":"true"})],-1),D=s("h5",{class:"mb-0"},"Loans",-1),L={class:"h5 text-warning mb-0 counter d-inline-block w-100"},M={class:"col-sm-6 col-md-6 col-lg-3"},N={class:"iq-card iq-card-block iq-card-stretch iq-card-height",style:{"border-radius":"0px"}},A={class:"iq-card-body iq-box-relative"},V={class:"d-flex align-items-center justify-content-between text-right"},F=s("div",{class:"icon iq-icon-box rounded-circle bg-danger"},[s("i",{class:"fa fa-money","aria-hidden":"true"})],-1),U=s("h5",{class:"mb-0"},"Deposits",-1),C={class:"h5 text-info mb-0 counter d-inline-block w-100"},E={class:"col-sm-6 col-md-6 col-lg-3"},I={class:"iq-card iq-card-block iq-card-stretch iq-card-height",style:{"border-radius":"0px"}},P={class:"iq-card-body iq-box-relative"},R={class:"d-flex align-items-center justify-content-between text-right"},T=s("div",{class:"icon iq-icon-box rounded-circle bg-secondary"},[s("i",{class:"las la-chalkboard-teacher","aria-hidden":"true"})],-1),W=s("h5",{class:"mb-0"},"Withdrawals",-1),$={class:"h5 text-secondary mb-0 counter d-inline-block w-100"},z={class:"col-12"},G={class:"iq-card iq-card-block iq-card-stretch iq-card-height"},H={class:"iq-card-body"},J={class:"col-lg-12"},K={class:"iq-card iq-card-block iq-card-stretch iq-card-height"},Q=s("div",{class:"iq-card-header d-flex justify-content-between"},[s("div",{class:"iq-header-title"},[s("h4",{class:"card-title"},"Recent Applications")]),s("div",{class:"iq-card-header-toolbar d-flex align-items-center"},[s("div",{class:"dropdown"},[s("span",{class:"dropdown-toggle",id:"dropdownMenuButton3","data-toggle":"dropdown"},[s("i",{class:"ri-more-fill"})]),s("div",{class:"dropdown-menu dropdown-menu-right","aria-labelledby":"dropdownMenuButton3",style:{}},[s("a",{class:"dropdown-item",href:"#"},[s("i",{class:"ri-eye-fill mr-2"}),c("View")]),s("a",{class:"dropdown-item",href:"#"},[s("i",{class:"ri-delete-bin-6-fill mr-2"}),c("Delete")]),s("a",{class:"dropdown-item",href:"#"},[s("i",{class:"ri-pencil-fill mr-2"}),c("Edit")]),s("a",{class:"dropdown-item",href:"#"},[s("i",{class:"ri-printer-fill mr-2"}),c("Print")]),s("a",{class:"dropdown-item",href:"#"},[s("i",{class:"ri-file-download-fill mr-2"}),c("Download")])])])])],-1),X={class:"iq-card-body"},Y={class:"table-responsive"},Z={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},ss=s("thead",null,[s("tr",null,[s("th",null,"Member"),s("th",null,"Loan"),s("th",null,"Interest"),s("th",null,"Amount"),s("th",null,"Service Fee"),s("th",null,"Status"),s("th",null,"Application Date")])],-1),es=s("td",null,[s("span",{class:"badge dark-icon-light iq-bg-primary"},"Active")],-1),ls={name:"Dashboard",props:{applications:Object,branches:Object,members:Object,loans:Object,loans_total:Number,deposits_total:Number,withdrawals_total:Number,deposits:Object,withdrawals:Object,payments:Object,leads:Object},setup(i){return(ts,is)=>{const o=r("Main");return a(),h(o,null,{default:_(()=>[s("div",p,[s("div",v,[s("div",g,[s("div",q,[s("div",f,[w,s("div",null,[x,s("span",y,e(i.members.length),1)])])])])]),s("div",k,[s("div",S,[s("div",O,[s("div",j,[B,s("div",null,[D,s("span",L,e(i.loans_total.toLocaleString("en-US")),1)])])])])]),s("div",M,[s("div",N,[s("div",A,[s("div",V,[F,s("div",null,[U,s("span",C,e(i.deposits_total.toLocaleString("en-US")),1)])])])])]),s("div",E,[s("div",I,[s("div",P,[s("div",R,[T,s("div",null,[W,s("span",$,e(i.withdrawals_total.toLocaleString("en-US")),1)])])])])]),s("div",z,[s("div",G,[s("div",H,[b(n)])])]),s("div",J,[s("div",K,[Q,s("div",X,[s("div",Y,[s("table",Z,[ss,s("tbody",null,[(a(!0),l(m,null,u(i.applications,(t,d)=>(a(),l("tr",{key:d},[s("td",null,e(t.member.first_name)+" "+e(t.member.last_name),1),s("td",null,e(t.loan_type.name),1),s("td",null,e(t.interest_rate),1),s("td",null,e(t.amount_applied),1),s("td",null,e(t.service_fee),1),es,s("td",null,e(t.application_date.substring(0,10)),1)]))),128))])])])])])])])]),_:1})}}};export{ls as default};
