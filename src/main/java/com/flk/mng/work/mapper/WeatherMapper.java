package com.flk.mng.work.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.flk.mng.work.domain.Weather;

@Repository
public interface WeatherMapper {

	/**
	 * 날씨별 부하량 조회
	 * @param weather
	 * @return
	 */
	List<Weather> selectWeatherOver(Weather weather);

}
