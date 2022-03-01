#!/bin/bash

LDAPGROUPCOUNT=$(ldapsearch -h ldap -D "cn=Directory" -x -b "ou=algorithmic trading quants,ou=apps,l=global,o=hedgefund.com" "(&(cn=*)(objectClass=groupOfUniqueNames))" | grep dn: | wc -l)

if [ $LDAPGROUPCOUNT -gt 4000 ]; then
        echo "CRITICAL: Threshold of 4000 has been breached. Please review immediately."
else
        echo "OK: Current group count is $LDAPGROUPCOUNT which is below the threshold of 4000."
fi
