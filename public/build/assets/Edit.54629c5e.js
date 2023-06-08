import{r as m,u as _,a as w,o as p,c as x,w as U,b as o,t as i,e as s,d as f,f as a,v as d,g as V,l as h,p as b,h as z,i as C}from"./app.7d06a11a.js";const P={class:"row"},q=o("div",{class:"col-lg-3"},[o("div",{class:"iq-card"},[o("div",{class:"iq-card-header d-flex justify-content-between"},[o("div",{class:"iq-header-title"},[o("h4",{class:"card-title"},"Add Admin User")])]),o("div",{class:"iq-card-body"},[o("form",null,[o("div",{class:"form-group"},[o("div",{class:"add-img-user profile-img-edit"},[o("img",{class:"profile-pic img-fluid",src:"/images/user/11.png",alt:"profile-pic"}),o("div",{class:"p-image"},[o("a",{href:"javascript:void();",class:"upload-button btn iq-bg-primary"},"File Upload"),o("input",{class:"file-upload",type:"file",accept:"image/*"})])]),o("div",{class:"img-extension mt-3"},[o("div",{class:"d-inline-block align-items-center"},[o("span",null,"Only"),o("a",{href:"javascript:void();"},".jpg"),o("a",{href:"javascript:void();"},".png"),o("a",{href:"javascript:void();"},".jpeg"),o("span",null,"allowed")])])]),o("div",{class:"form-group"},[o("label",null,"User Role:"),o("select",{class:"form-control",id:"selectuserrole"},[o("option",null,"Select"),o("option",null,"Admin")])]),o("div",{class:"form-group"},[o("label",{for:"furl"},"Website:"),o("input",{type:"text",class:"form-control",id:"furl",placeholder:"Website Url"})]),o("div",{class:"form-group"},[o("label",{for:"lurl"},"Linkedin Url:"),o("input",{type:"text",class:"form-control",id:"lurl",placeholder:"Linkedin Url"})])])])])],-1),S={class:"iq-card col-lg-9"},A={class:"iq-card-header d-flex justify-content-between"},k={class:"iq-header-title"},N={class:"card-title"},T={class:"iq-card-body"},j={class:"new-user-info"},B={class:"row"},M={class:"form-group col-md-6"},F=o("label",{for:"business_name"},"Business Name:",-1),O={class:"form-group col-md-6"},E=o("label",{for:"business_type"},"Business Type:",-1),R={class:"form-group col-md-6"},D=o("label",{for:"postal_code"},"Postal Code:",-1),L={class:"form-group col-md-6"},W=o("label",{for:"postal_address"},"Postal Address:",-1),J={class:"form-group col-md-12"},K=o("label",{for:"physical_address"},"Physical Address:",-1),$={class:"form-group col-sm-12"},G=o("label",null,"Country:",-1),H=o("option",null,"Select Country",-1),I=o("option",null,"Kenya",-1),Q=o("option",null,"Uganda",-1),X=o("option",null,"Tanzania",-1),Y=o("option",null,"South Africa",-1),Z=[H,I,Q,X,Y],oo={class:"form-group col-md-6"},so=o("label",{for:"mobno"},"Mobile Number:",-1),eo={class:"form-group col-md-6"},to=o("label",{for:"altconno"},"Alternate Contact:",-1),lo={class:"form-group col-md-6"},ao=o("label",{for:"email"},"Email:",-1),no={class:"form-group col-md-6"},ro=o("label",{for:"pno"},"County/City:",-1),io={class:"form-group col-md-12"},co={class:"form-group"},po=o("label",{for:"exampleFormControlTextarea1"},"About",-1),uo={type:"submit",class:"btn btn-primary"},mo=["onSubmit"],_o=o("hr",null,null,-1),fo=o("h5",{class:"mb-3"},"Change Password",-1),ho={class:"row"},bo={class:"form-group col-md-12"},go=o("label",{for:"old_password"},"Old Password:",-1),yo={key:0,class:"text-danger"},vo={class:"form-group col-md-6"},wo=o("label",{for:"password"},"New Password:",-1),xo={key:0,class:"text-danger"},Uo={class:"form-group col-md-6"},Vo=o("label",{for:"rpass"},"Repeat Password:",-1),zo={class:"checkbox"},Co=C("Enable Two-Factor-Authentication"),Po=o("button",{type:"submit",class:"btn btn-primary"}," Change Password ",-1),So={name:"Edit",props:{organization:Object},setup(g){const n=g;let l=m(""),u=m("Edit");l=_({_method:"PUT",business_name:n.organization.business_name,business_type:n.organization.business_type,email:n.organization.email,phone:n.organization.phone,alternate_phone:n.organization.alternate_phone,country:n.organization.country,county:n.organization.county,about:n.organization.about,physical_address:n.organization.physical_address,postal_address:n.organization.postal_address,postal_code:n.organization.postal_code,username:n.organization.username,town:n.organization.town});const r=_({old_password:"",password:"",password_confirmation:""}),y=()=>{r.post(route("change.password"),{preserveScroll:!0,onSuccess:()=>{JSON.stringify(r.errors)=="{}"&&(window.scrollTo({top:0,behavior:"smooth"}),r.reset())}})};return(c,e)=>{const v=w("Main");return p(),x(v,null,{default:U(()=>[o("div",P,[q,o("div",S,[o("div",A,[o("div",k,[o("h4",N,i(s(u))+" Organization.",1)])]),o("div",T,[o("form",{onSubmit:e[11]||(e[11]=f(t=>c.saveForm(),["prevent"])),class:""},[o("div",j,[o("div",B,[o("div",M,[F,a(o("input",{type:"text","onUpdate:modelValue":e[0]||(e[0]=t=>s(l).business_name=t),class:"form-control",required:"",id:"business_name",placeholder:"Business Name"},null,512),[[d,s(l).business_name]])]),o("div",O,[E,a(o("input",{type:"text",class:"form-control",required:"","onUpdate:modelValue":e[1]||(e[1]=t=>s(l).business_type=t),id:"business_type",placeholder:"Business Type"},null,512),[[d,s(l).business_type]])]),o("div",R,[D,a(o("input",{type:"text",class:"form-control",id:"postal_code","onUpdate:modelValue":e[2]||(e[2]=t=>c.postal_code=t),placeholder:"Postal Code"},null,512),[[d,c.postal_code]])]),o("div",L,[W,a(o("input",{type:"text","onUpdate:modelValue":e[3]||(e[3]=t=>s(l).postal_address=t),class:"form-control",id:"postal_address",placeholder:"Postal Address"},null,512),[[d,s(l).postal_address]])]),o("div",J,[K,a(o("input",{type:"text",class:"form-control","onUpdate:modelValue":e[4]||(e[4]=t=>s(l).physical_address=t),id:"physical_address",placeholder:"Physical Address"},null,512),[[d,s(l).physical_address]])]),o("div",$,[G,a(o("select",{required:"","onUpdate:modelValue":e[5]||(e[5]=t=>s(l).country=t),class:"form-control",id:"selectcountry"},Z,512),[[V,s(l).country]])]),o("div",oo,[so,a(o("input",{type:"text",class:"form-control","onUpdate:modelValue":e[6]||(e[6]=t=>s(l).phone=t),id:"mobno",placeholder:"Mobile Number"},null,512),[[d,s(l).phone]])]),o("div",eo,[to,a(o("input",{type:"text",class:"form-control",id:"altconno","onUpdate:modelValue":e[7]||(e[7]=t=>s(l).alternate_phone=t),placeholder:"Alternate Contact"},null,512),[[d,s(l).alternate_phone]])]),o("div",lo,[ao,a(o("input",{type:"email",required:"",class:"form-control",id:"email","onUpdate:modelValue":e[8]||(e[8]=t=>s(l).email=t),placeholder:"Email"},null,512),[[d,s(l).email]])]),o("div",no,[ro,a(o("input",{type:"text",class:"form-control",id:"pno","onUpdate:modelValue":e[9]||(e[9]=t=>s(l).county=t),placeholder:"County/State"},null,512),[[d,s(l).county]])]),o("div",io,[o("div",co,[po,a(o("textarea",{class:"form-control","onUpdate:modelValue":e[10]||(e[10]=t=>s(l).about=t),placeholder:"Short description",id:"exampleFormControlTextarea1",rows:"4"},null,512),[[d,s(l).about]])])])]),o("button",uo,i(s(u))+" Organization ",1)])],32),o("form",{onSubmit:f(y,["prevent"])},[_o,fo,o("div",ho,[o("div",bo,[go,a(o("input",{type:"password",class:"form-control","onUpdate:modelValue":e[12]||(e[12]=t=>s(r).old_password=t),id:"old_password",placeholder:"Old Password"},null,512),[[d,s(r).old_password]]),s(r).errors.old_password?(p(),h("div",yo,[o("small",null,i(s(r).errors.old_password),1)])):b("",!0)]),o("div",vo,[wo,a(o("input",{type:"password",class:"form-control",id:"password",required:"","onUpdate:modelValue":e[13]||(e[13]=t=>s(r).password=t),placeholder:"New Password"},null,512),[[d,s(r).password]]),s(r).errors.password?(p(),h("div",xo,[o("small",null,i(s(r).errors.password),1)])):b("",!0)]),o("div",Uo,[Vo,a(o("input",{type:"password",class:"form-control",id:"rpass",required:"","onUpdate:modelValue":e[14]||(e[14]=t=>s(r).password_confirmation=t),placeholder:"Repeat Password "},null,512),[[d,s(r).password_confirmation]])])]),o("div",zo,[o("label",null,[a(o("input",{"onUpdate:modelValue":e[15]||(e[15]=t=>s(l).two_factor=t),class:"mr-2",type:"checkbox"},null,512),[[z,s(l).two_factor]]),Co])]),Po],40,mo)])])])]),_:1})}}};export{So as default};