package com.flyaway.dao;

import java.util.List;

import com.flyaway.model.Features;

public interface FeaturesDao {
	public List<Features> getFeaturesForFlight(String flightId, String className);
}
