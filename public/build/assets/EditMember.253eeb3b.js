import{a as d,o as b,c as h,w as t,b as s,t as r,k as i,z as o,e as c,j as n,A as _}from"./app.a9a0490e.js";const u={class:"row"},p={class:"col-sm-12"},f={class:"iq-card iq-card-block iq-card-stretch iq-card-height"},v={class:"user-post-data px-3 pt-3"},g={class:"d-flex flex-wrap pb-0 mb-0"},k=s("div",{class:"media-support-user-img mr-3"},[s("img",{class:"rounded-circle img-fluid",style:{height:"60px",width:"60px"},src:"/images/user/01.jpg",alt:""})],-1),w={class:"media-support-info"},y={class:"mb-0"},W={href:"#",class:""},q={class:"mb-0 text-primary"},x=s("hr",null,null,-1),j={class:"iq-card-body pt-0"},A={class:"items-tabs"},D={class:"d-flex justify-content-between"},B={class:"tabs-menu",style:{"overflow-y":"hidden"}},C=s("i",{class:"ri-home-3-line mr-2"},null,-1),L=s("span",null,"Details",-1),M=[C,L],S=s("i",{class:"ri-database-line mr-2"},null,-1),z=s("span",null,"Assets",-1),N=[S,z],V=s("i",{class:"ri-login-circle-line mr-2"},null,-1),E=s("span",null,"Deposits",-1),O=[V,E],P=s("i",{class:"ri-bar-chart-line mr-2"},null,-1),$=s("span",null,"Dividends",-1),F=[P,$],G=s("i",{class:"ri-stack-line mr-2"},null,-1),H=s("span",null,"Active Loans",-1),I=[G,H],J=s("i",{class:"ri-checkbox-line mr-2"},null,-1),K=s("span",null,"Applications",-1),Q=[J,K],R=s("div",{class:"tab-content-wrapper pt-0 mt-0 mb-3"},null,-1),X={name:"EditMember",props:{member:Object,title:String},setup(e){return(a,T)=>{const l=d("Link"),m=d("Main");return b(),h(m,null,{default:t(()=>[s("div",u,[s("div",p,[s("div",f,[s("div",v,[s("div",g,[k,s("div",w,[s("h5",y,[s("a",W,r(e.member.user.first_name)+" "+r(e.member.user.last_name),1)]),s("p",q,r(e.title),1)])]),x]),s("div",j,[s("div",A,[s("div",D,[s("div",B,[i(l,{class:"tab",href:a.route("members.edit",e.member.id)},{default:t(()=>[s("label",{class:o(["pb-0 mb-0",c(n)().url.value.startsWith("/members/"+e.member.id)?"active-tab":""])},M,2)]),_:1},8,["href"]),i(l,{class:"tab collapse",href:a.route("members.assets",e.member.id)},{default:t(()=>[s("label",{class:o(["pb-0 mb-0",c(n)().url.value.startsWith("/members/assets")?"active-tab":""])},N,2)]),_:1},8,["href"]),i(l,{class:"tab",href:a.route("members.deposits",e.member.id)},{default:t(()=>[s("label",{class:o(["pb-0 mb-0",c(n)().url.value.startsWith("/members/deposits")?"active-tab":""])},O,2)]),_:1},8,["href"]),i(l,{class:"tab",href:"#"},{default:t(()=>[s("label",{class:o(["pb-0 mb-0 collapse",c(n)().url.value.startsWith("/memberss")?"active-tab":""])},F,2)]),_:1}),i(l,{class:"tab",href:a.route("members.loans",e.member.id)},{default:t(()=>[s("label",{class:o(["pb-0 mb-0",c(n)().url.value.startsWith("/members/loans")?"active-tab":""])},I,2)]),_:1},8,["href"]),i(l,{class:"tab",href:a.route("members.applications",e.member.id)},{default:t(()=>[s("label",{class:o(["pb-0 mb-0",c(n)().url.value.startsWith("/members/applications")?"active-tab":""])},Q,2)]),_:1},8,["href"])])]),R]),_(a.$slots,"default")])])])])]),_:3})}}};export{X as default};
