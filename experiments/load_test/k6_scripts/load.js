import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
    insecureSkipTLSVerify: true,
    noConnectionReuse: false,
    stages: [
        { duration: '5m', target: 100 }, // simulate traffic from 1 to 100 users in 5 minutes
        { duration: '10m', target: 100 }, // stay at 100 users for 10 minutes
        { duration: '5m', target: 0 }, // ramp-down to 0
    ],
    thresholds: {
        http_req_duration: ['p(99)<150'], // 99% of requests must complete below 150ms
    },
};

export default () => {
    const response = http.get('http://localhost');
    check(response, {
        "status is 200": (r) => r.status == 200,
        "duration is <= 200": (r) => r.timings.duration <= 200
    })
    sleep(1);
};
