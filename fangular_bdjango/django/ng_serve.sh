#!/bin/bash
cd /var/www/html/LendingAlly/lendingfrontend
npm link @angular/cli@9.0.6
sleep 10
ng serve --host=0.0.0.0 --disable-host-check; & 
