import{a as o,o as r,c as u,w as a,b as s,k as l,z as c,A as h,i as n}from"./app.8c14ce0c.js";const v={class:"row"},_={class:"col-sm-12 col-lg-12"},f={class:"iq-card"},m=s("div",{class:"iq-card-header d-flex justify-content-between"},[s("div",{class:"iq-header-title"},[s("h4",{class:"card-title"},"Active Loan")])],-1),y={class:"iq-card-body"},k={class:"nav nav-tabs",id:"myTab-2",role:"tablist"},b={class:"nav-item"},z=s("i",{class:"ri-list-settings-line pr-1",style:{"font-size":"20px"}},null,-1),L=n(" Details"),g={class:"nav-item"},p=s("i",{class:"ri-refund-fill pr-1",style:{"font-size":"20px"}},null,-1),w=n(" Collateral"),x={class:"nav-item"},q=s("i",{class:"ri-safe-fill pr-1",style:{"font-size":"20px"}},null,-1),A=n(" Guarantors"),C={class:"nav-item"},N=s("i",{class:"ri-money-dollar-circle-line pr-1",style:{"font-size":"20px"}},null,-1),B=n(" Payments"),V={class:"nav-item"},M=s("i",{class:"ri-edit-box-line pr-1",style:{"font-size":"20px"}},null,-1),S=n(" Accrue"),D={name:"EditApplication",props:{id:Number,active:String},setup(e){return(t,T)=>{const i=o("Link"),d=o("Main");return r(),u(d,null,{default:a(()=>[s("div",v,[s("div",_,[s("div",f,[m,s("div",y,[s("ul",k,[s("li",b,[l(i,{class:c(["nav-link",e.active=="details"?"active":""]),href:t.route("u.view.loan",e.id)},{default:a(()=>[z,L]),_:1},8,["class","href"])]),s("li",g,[l(i,{class:c(["nav-link",e.active=="collaterals"?"active":""]),href:t.route("u.activeLoans.collateral",e.id)},{default:a(()=>[p,w]),_:1},8,["class","href"])]),s("li",x,[l(i,{class:c(["nav-link",e.active=="guarantors"?"active":""]),href:t.route("u.activeLoans.guarantors",e.id)},{default:a(()=>[q,A]),_:1},8,["class","href"])]),s("li",C,[l(i,{class:c(["nav-link",e.active=="payments"?"active":""]),href:t.route("u.activeLoans.payments",e.id)},{default:a(()=>[N,B]),_:1},8,["class","href"])]),s("li",V,[l(i,{class:c(["nav-link",e.active=="accrue"?"active":""]),href:t.route("u.activeLoans.accrue",e.id)},{default:a(()=>[M,S]),_:1},8,["class","href"])])]),h(t.$slots,"default")])])])])]),_:3})}}};export{D as default};