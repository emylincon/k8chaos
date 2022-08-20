import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    insecureSkipTLSVerify: true,
    noConnectionReuse: false,
    stages: [
        { duration: '5m', target: 400 }, // simulate traffic from 1 to 100 users in 5 minutes
        { duration: '3h10m', target: 400 }, // stay at 100 users for 10 minutes
        { duration: '5m', target: 0 }, // ramp-down to 0
    ],
    thresholds: {
        http_req_duration: ['p(99)<150'], // 99% of requests must complete below 150ms
    },
};

export default () => {
    http.get('http://localhost');
    sleep(1);
};
