import{a as r,o as c,c as h,w as _,b as s,l,m as d,t as e,F as n}from"./app.1732e059.js";const u={class:"row"},b={class:"col-md-12 col-lg-12"},p={class:"iq-card iq-card-block iq-card-stretch iq-card-height"},v=s("div",{class:"iq-card-header d-flex justify-content-between"},[s("div",{class:"iq-header-title"},[s("h4",{class:"card-title"},"Account Classes")])],-1),m={class:"iq-card-body"},q={class:"table-responsive"},y={class:"table mb-0 table-borderless"},f=s("thead",null,[s("tr",null,[s("th",{scope:"col"},"Account Class"),s("th",{scope:"col"},"Category")])],-1),g={class:"col-lg-12"},C={class:"iq-card iq-card-block iq-card-stretch iq-card-height overflow-hidden"},k=s("div",{class:"iq-card-header d-flex justify-content-between"},[s("div",{class:"iq-header-title"},[s("h4",{class:"card-title"},"Account Types")])],-1),w={class:"iq-card-body"},x={class:"table-responsive"},A={class:"table mb-0 table-borderless"},j=s("thead",null,[s("tr",null,[s("th",{scope:"col"},"Account Type"),s("th",{scope:"col"},"Code"),s("th",{scope:"col"},"Class"),s("th",{scope:"col"},"Description")])],-1),F={name:"Accounts",props:{accounts:Object,filters:Object},setup(a){return(B,T)=>{const i=r("Main");return c(),h(i,null,{default:_(()=>[s("div",u,[s("div",b,[s("div",p,[v,s("div",m,[s("div",q,[s("table",y,[f,s("tbody",null,[(c(!0),l(n,null,d(a.accounts.accountClasses,(t,o)=>(c(),l("tr",{key:o},[s("td",null,e(t.name),1),s("td",null,e(t.category),1)]))),128))])])])])])]),s("div",g,[s("div",C,[k,s("div",w,[s("div",x,[s("table",A,[j,s("tbody",null,[(c(!0),l(n,null,d(a.accounts.accountTypes,(t,o)=>(c(),l("tr",{key:o},[s("td",null,e(t.name),1),s("td",null,e(t.code),1),s("td",null,e(t.account_class.name),1),s("td",null,e(t.description),1)]))),128))])])])])])])])]),_:1})}}};export{F as default};
