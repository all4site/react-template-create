#!/bin/bash
dir=$(find $(pwd) -name "templates")

if [[ ! $dir ]]; then
    echo 'Create templates'
    exit
fi

######Default options######
if [[ ! $2 ]]; then
    mkdir -p components/$1
    cp templates/components/TemplateName.jsx components/$1/$1.jsx
    cp templates/components/index.jsx components/$1/index.jsx
    cp templates/components/templatename.module.sass components/$1/${1,,}.module.sass

    sed -i s/templatename/${1,,}/g components/$1/${1,,}.module.sass
    sed -i s/templatename/${1,,}/g components/$1/$1.jsx
    sed -i s/TemplateName/$1/g components/$1/$1.jsx
    sed -i s/TemplateName/$1/g components/$1/index.jsx

    echo 'Component created'
    exit
fi


######Models component######

if [[ $2 == 'models' ]]; then
    mkdir -p $2
    cp templates/$2/TemplateName.models.js $2/$1.models.js
    sed -i s/TemplateNameSchema/$1Schema/g $2/$1.models.js
    sed -i s/TemplateName/$1s/g $2/$1.models.js
    echo 'Component created' 
    exit
    else
    echo 'Error component name'
    exit
fi


