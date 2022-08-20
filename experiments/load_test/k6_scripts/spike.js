import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    insecureSkipTLSVerify: true,
    noConnectionReuse: false,
    stages: [
        { duration: '10s', target: 100 }, // below normal load
        { duration: '1m', target: 100 },
        { duration: '10s', target: 1400 }, // normal load
        { duration: '3m', target: 1400 },
        { duration: '10s', target: 100 }, // around the breakpoint
        { duration: '3m', target: 100 },
        { duration: '10s', target: 0 }, // beyond the breakpoint
    ],
}


export default () => {
    http.get('http://localhost');
    sleep(1);
};
