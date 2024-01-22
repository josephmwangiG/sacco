import{r as m,a as p,o as s,c as v,w as f,b as t,l as o,m as g,t as l,k as r,s as u,F as w,e as c,n as L,i}from"./app.24fde918.js";import M from"./Amortization.7cd11620.js";import S from"./Statement.8798e033.js";const A={class:"row"},B={class:"col-sm-12"},x={class:"iq-card"},$={class:"iq-card-body"},q=t("div",{class:"d-flex justify-content-between mt-2"},[t("h5",null,"Active Loans"),t("div",{class:"user-list-files"},[t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ")])],-1),N={class:"table-responsive"},V={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},F=t("thead",null,[t("tr",null,[t("th",null,"Ref No."),t("th",null,"Loan"),t("th",null,"Interest"),t("th",null,"Amount"),t("th",null,"Service Fee"),t("th",null,"Status"),t("th",null,"Start Date"),t("th",null,"Action")])],-1),P=t("td",null,[t("span",{class:"active"},"Active")],-1),T={class:"flex align-items-center list-user-action"},D={class:"dropdown"},O=t("span",{class:"",id:"dropdownMenuButton2","data-toggle":"dropdown"},[t("strong",null,[t("i",{class:"ri-more-fill"})])],-1),z={class:"dropdown-menu dropdown-menu-right","aria-labelledby":"dropdownMenuButton2",style:{}},E=t("i",{class:"ri-eye-fill mr-2"},null,-1),G=i(" View"),H=["onClick"],I=t("i",{class:"ri-printer-fill mr-2"},null,-1),R=i("Amortization"),J=[I,R],K=["onClick"],Q=t("i",{class:"ri-file-download-fill mr-2"},null,-1),U=i("Statement"),W=[Q,U],X={class:"row justify-content-between mt-3"},Y={id:"user-list-page-info",class:"col-md-6"},Z={class:"col-md-6"},j={"aria-label":"Page navigation example"},tt={class:"pagination justify-content-end mb-0"},et={class:"iq-card-body"},lt=t("div",{class:"d-flex justify-content-between mt-2"},[t("h5",null,"Guaranteed Loans"),t("div",{class:"user-list-files"},[t("a",{class:"iq-bg-primary",href:"javascript:void();"}," Print ")])],-1),nt={class:"table-responsive"},st={id:"user-list-table",class:"table table-striped table-borderless mt-4",role:"grid","aria-describedby":"user-list-page-info"},at=t("thead",null,[t("tr",null,[t("th",null,"Member"),t("th",null,"Loan"),t("th",null,"Interest"),t("th",null,"Loan Amount"),t("th",null,"Service Fee"),t("th",null,"Status"),t("th",null,"Date"),t("th",null,"G. Amount"),t("th",null,"Action")])],-1),ot={class:"active"},it={class:"flex align-items-center list-user-action"},dt={class:"dropdown"},ct=t("span",{class:"",id:"dropdownMenuButton2","data-toggle":"dropdown"},[t("strong",null,[t("i",{class:"ri-more-fill"})])],-1),rt={class:"dropdown-menu dropdown-menu-right","aria-labelledby":"dropdownMenuButton2",style:{}},ut=t("i",{class:"ri-pencil-fill mr-2"},null,-1),_t=i(" Edit"),ht=["onClick"],mt=t("i",{class:"ri-printer-fill mr-2"},null,-1),pt=i("Amortization"),vt=[mt,pt],ft=["onClick"],gt=t("i",{class:"ri-file-download-fill mr-2"},null,-1),wt=i("Statement"),yt=[gt,wt],Mt={name:"Loans",props:{member:Object,activeLoans:Object,guarantors:Object},setup(a){let b=m(),n=m("");return m(0),(y,Lt)=>{const _=p("Link"),k=p("Confirm"),C=p("Main");return s(),v(C,null,{default:f(()=>[t("div",A,[t("div",B,[t("div",x,[t("div",$,[q,t("div",N,[t("table",V,[F,t("tbody",null,[(s(!0),o(w,null,g(a.activeLoans.data,(e,d)=>(s(),o("tr",{key:d},[t("td",null,l(e.loan_reference_number),1),t("td",null,l(e.loanType.name),1),t("td",null,l(e.interest_rate),1),t("td",null,l(e.amount_approved),1),t("td",null,l(e.service_fee),1),P,t("td",null,l(e.start_date.substring(0,10)),1),t("td",null,[t("div",T,[t("div",D,[O,t("div",z,[r(_,{class:"dropdown-item",href:y.route("u.view.loan",e.id)},{default:f(()=>[E,G]),_:2},1032,["href"]),t("a",{class:"dropdown-item",onClick:h=>u(n)?n.value=e:n=e,href:"#formModal","data-toggle":"modal"},J,8,H),t("a",{class:"dropdown-item",href:"#loanStatement",onClick:h=>u(n)?n.value=e:n=e,"data-toggle":"modal"},W,8,K)])])])])]))),128))])])]),t("div",X,[t("div",Y,[t("span",null,"Showing 1 to "+l(a.activeLoans.total>10?"10":a.activeLoans.total)+" of "+l(a.activeLoans.total)+" entries",1)]),t("div",Z,[t("nav",j,[t("ul",tt,[(s(!0),o(w,null,g(a.activeLoans.links,(e,d)=>(s(),o("li",{class:"page-item active",key:d},[r(_,{class:"page-link",href:e.url,innerHTML:e.label},null,8,["href","innerHTML"])]))),128))])])])])]),t("div",et,[lt,t("div",nt,[t("table",st,[at,t("tbody",null,[(s(!0),o(w,null,g(a.guarantors,(e,d)=>(s(),o("tr",{key:d},[t("td",null,l(e.loan_application.member.user.first_name)+" "+l(e.loan_application.member.user.last_name),1),t("td",null,l(e.loan_application.loan_type.name),1),t("td",null,l(e.loan_application.interest_rate),1),t("td",null,l(e.loan_application.loan==null?e.loan_application.amount_applied:e.loan_application.loan.amount_approved),1),t("td",null,l(e.loan_application.service_fee),1),t("td",null,[t("span",ot,l(e.loan_application.loan==null?"Pending":"Active"),1)]),t("td",null,l(e.loan_application.application_date.substring(0,10)),1),t("td",null,l(e.guarantee_amount),1),t("td",null,[t("div",it,[t("div",dt,[ct,t("div",rt,[r(_,{class:"dropdown-item",href:y.route("activeLoans.edit",e.id)},{default:f(()=>[ut,_t]),_:2},1032,["href"]),t("a",{class:"dropdown-item",onClick:h=>u(n)?n.value=e:n=e,href:"#formModal","data-toggle":"modal"},vt,8,ht),t("a",{class:"dropdown-item",href:"#loanStatement",onClick:h=>u(n)?n.value=e:n=e,"data-toggle":"modal"},yt,8,ft)])])])])]))),128))])])])])])])]),c(n)!=""?(s(),v(M,{key:0,activeLoan:c(n)},null,8,["activeLoan"])):L("",!0),c(n)!=""?(s(),v(S,{key:1,activeLoan:c(n)},null,8,["activeLoan"])):L("",!0),r(k,{url:c(b)},null,8,["url"])]),_:1})}}};export{Mt as default};
