package com.study.nbnb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.study.nbnb.dao.BuserDao;

@Service
public class AsyncService {
	@Autowired
    private BuserDao buserDao;

    @Async
    public void convertAddressToCoordinates(String address) {
        // 주소를 좌표로 변환하는 작업 수행
        double[] coords = buserDao.addressToCoordinate(address);

        // 변환된 좌표를 DB에 업데이트
        buserDao.updateAddress(address, coords[0], coords[1]);
    }
}
