package com.flk.mng.work.service;

import java.util.List;

import com.flk.mng.work.domain.Weather;

public interface WeatherService {

	/**
	 * 날씨별 부하량 조회
	 * @param weather
	 * @return
	 * @throws Exception
	 */
	List<Weather> selectWeatherOver(Weather weather) throws Exception;;


}
