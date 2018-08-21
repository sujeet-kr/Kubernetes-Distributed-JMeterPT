#!/usr/bin/env bash
#bash to stop test execution

working_dir=`pwd`

thenamespace=`awk '{print $NF}' $working_dir/thenamespace`

jmeter_master=`kubectl get po -n $thenamespace | grep jmeter-master | awk '{print $1}'`
echo "Sending stop command to ${jmeter_master}"
kubectl -n $thenamespace exec -it $jmeter_master bash /jmeter/apache-jmeter-4.0/bin/stoptest.sh