#!/bin/bash

echo "/usr/local/bin/e2e.test  --ginkgo.focus=\"${E2E_FOCUS}\" --provider=local --report-dir=\"${RESULTS_DIR}\" --kubeconfig=/node/root/.kube/config "
/usr/local/bin/e2e.test --ginkgo.focus="${E2E_FOCUS}" --provider=local --report-dir="${RESULTS_DIR}" --kubeconfig=/node/root/.kube/config | tee ${RESULTS_DIR}/e2e.log
# tar up the results for transmission back
cd ${RESULTS_DIR}
tar -czf e2e.tar.gz * 
# mark the done file as a termination notice.
echo -n ${RESULTS_DIR}/e2e.tar.gz > ${RESULTS_DIR}/done