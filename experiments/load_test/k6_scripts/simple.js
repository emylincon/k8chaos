import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
    insecureSkipTLSVerify: true,
    noConnectionReuse: false,
    duration: '20s',
    vus: 10,
};

export default () => {
    http.get('http://localhost');
    sleep(1);
};
