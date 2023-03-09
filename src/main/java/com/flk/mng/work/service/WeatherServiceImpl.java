package com.flk.mng.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flk.mng.work.domain.Weather;
import com.flk.mng.work.mapper.WeatherMapper;


@Service
public class WeatherServiceImpl implements WeatherService{

	@Autowired
	private WeatherMapper weatherMapper;

	@Override
	public List<Weather> selectWeatherOver(Weather weather) throws Exception {
		return weatherMapper.selectWeatherOver(weather);
	}

}
