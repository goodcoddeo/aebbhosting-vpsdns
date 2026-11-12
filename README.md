```
curl -fsSL https://raw.githubusercontent.com/goodcoddeo/aebbhosting-vpsdns/refs/heads/main/fix-dns.sh -o ./fix-dns.sh && chmod +x ./fix-dns.sh && sudo ./fix-dns.sh
```

## aebb vps에서 aebb 자체 dns 변경으로 인한 외부 네트워크 통신이 불가능해지는 현상을 해결하기 위한 스크립트입니다.

## DNS 설정 파일을 주기적으로 덮어써서 지정된 DNS 서버로 변경합니다.

### ⚠️ 주의사항
- DNS 설정 파일에 기존에 직접 지정해 둔 설정이 있다면 해당 내용은 덮어써집니다.
- 설치 후 시스템이 자동으로 DNS 설정을 변경하며, 서버 재부팅 후에도 적용됩니다.
- **설치가 된 상태이지만, 그래도 통신이 불가능하다면 `sudo systemctl restart networking`를 한번 입력해주세요.**
