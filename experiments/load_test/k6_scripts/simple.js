import http from 'k6/http';
import { sleep, check } from 'k6';

export let options = {
    insecureSkipTLSVerify: true,
    noConnectionReuse: false,
    duration: '20s',
    vus: 10,
};

export default () => {
    const response = http.get('http://localhost');
    check(response, {
        "status is 200": (r) => r.status == 200,
        "duration is <= 200": (r) => r.timings.duration <= 200
    })
    sleep(1);
};
