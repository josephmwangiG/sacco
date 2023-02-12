import{o as l,l as d,b as o,t as r,d as u,f as a,v as c,p as i,g as f}from"./app.1732e059.js";const h={class:"modal fade",id:"formModal",tabindex:"-1",role:"dialog","aria-labelledby":"formModal","aria-hidden":"true"},b={class:"modal-dialog modal-lg",role:"document"},y={class:"modal-content"},v={class:"modal-header"},g={class:"modal-title",id:"formModal"},_=o("button",{type:"button",class:"close","data-dismiss":"modal","aria-label":"Close"},[o("span",{"aria-hidden":"true"},"\xD7")],-1),x={class:"modal-body"},C={class:"new-user-info"},B={class:"row"},k={class:"form-group col-md-6"},S=o("label",{for:"name"},"Branch Name:",-1),p={key:0,class:"text-danger"},w={class:"form-group col-md-6"},M=o("label",{for:"branch_code"},"Branch Code:",-1),V={key:0,class:"text-danger"},U={class:"form-group col-md-6"},N=o("label",{for:"address"},"Physical Address:",-1),A={key:0,class:"text-danger"},E={class:"form-group col-sm-6"},F=o("label",null,"Country:",-1),q=o("option",{value:""},"Select Country",-1),D=o("option",null,"Caneda",-1),I=o("option",null,"Noida",-1),T=o("option",null,"USA",-1),j=o("option",null,"India",-1),O=o("option",null,"Africa",-1),P=[q,D,I,T,j,O],$={key:0,class:"text-danger"},z={class:"form-group col-md-6"},G=o("label",{for:"pno"},"County/City:",-1),H={key:0,class:"text-danger"},J={class:"form-group col-md-12"},K={class:"form-group"},L=o("label",{for:"exampleFormControlTextarea1"},"Description",-1),Q={key:0,class:"text-danger"},R={class:"modal-footer"},W=o("button",{type:"button",id:"closeModal",class:"btn btn-secondary","data-dismiss":"modal"}," Close ",-1),X={type:"submit",class:"btn btn-primary"},oo={name:"BranchForm",props:{form:Object,action:String,item:Number},setup(e){const n=e;function m(){n.action=="Edit"?n.form.put(route("branches.update",n.item),{onSuccess:()=>{n.form.reset(),document.getElementById("closeModal").click()}}):n.form.post(route("branches.store"),{onSuccess:()=>{n.form.reset(),document.getElementById("closeModal").click()}})}return(Y,t)=>(l(),d("div",h,[o("div",b,[o("div",y,[o("div",v,[o("h5",g,r(e.action)+" Branch.",1),_]),o("form",{onSubmit:t[6]||(t[6]=u(s=>m(),["prevent"]))},[o("div",x,[o("div",C,[o("div",B,[o("div",k,[S,a(o("input",{type:"text","onUpdate:modelValue":t[0]||(t[0]=s=>e.form.name=s),class:"form-control",required:"",id:"name",placeholder:"Branch Name"},null,512),[[c,e.form.name]]),e.form.errors.name?(l(),d("div",p,[o("small",null,r(e.form.errors.name),1)])):i("",!0)]),o("div",w,[M,a(o("input",{type:"number",class:"form-control",required:"","onUpdate:modelValue":t[1]||(t[1]=s=>e.form.branch_code=s),id:"branch_code",placeholder:"Branch Code"},null,512),[[c,e.form.branch_code]]),e.form.errors.branch_code?(l(),d("div",V,[o("small",null,r(e.form.errors.branch_code),1)])):i("",!0)]),o("div",U,[N,a(o("input",{type:"text",class:"form-control",id:"address","onUpdate:modelValue":t[2]||(t[2]=s=>e.form.address=s),placeholder:"Address"},null,512),[[c,e.form.address]]),e.form.errors.address?(l(),d("div",A,[o("small",null,r(e.form.errors.address),1)])):i("",!0)]),o("div",E,[F,a(o("select",{required:"","onUpdate:modelValue":t[3]||(t[3]=s=>e.form.country=s),class:"form-control",id:"selectcountry"},P,512),[[f,e.form.country]]),e.form.errors.country?(l(),d("div",$,[o("small",null,r(e.form.errors.country),1)])):i("",!0)]),o("div",z,[G,a(o("input",{type:"text",class:"form-control",id:"pno","onUpdate:modelValue":t[4]||(t[4]=s=>e.form.town=s),placeholder:"County/State"},null,512),[[c,e.form.town]]),e.form.errors.town?(l(),d("div",H,[o("small",null,r(e.form.errors.town),1)])):i("",!0)]),o("div",J,[o("div",K,[L,a(o("textarea",{class:"form-control","onUpdate:modelValue":t[5]||(t[5]=s=>e.form.description=s),placeholder:"Short description",id:"exampleFormControlTextarea1",rows:"4"},null,512),[[c,e.form.description]]),e.form.errors.description?(l(),d("div",Q,[o("small",null,r(e.form.errors.description),1)])):i("",!0)])])])])]),o("div",R,[W,o("button",X,r(e.action)+" Branch ",1)])],32)])])]))}};export{oo as default};
