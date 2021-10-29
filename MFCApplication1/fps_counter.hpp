/*
C++ library for calculating the fps/time for an event to run
https://github.com/leonitousconforti/cpp-fps-counter
MIT License
Copyright (c) 2020 leo Conforti
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#pragma once
#include "pch.h"

#include <chrono>
#include <ctime>

// Class for timing events
class Interval
{
private:
	typedef std::chrono::steady_clock Time;
	std::chrono::steady_clock::time_point initial_;

public:
	inline Interval() : initial_(Time::now()) {}
	virtual ~Interval() {}

	inline unsigned int value() const
	{
		return std::chrono::duration_cast<std::chrono::microseconds>
			(Time::now() - initial_).count();
	}

	inline void reset()
	{
		initial_ = Time::now();
	}
};

// Class for calculating the fps of a loop or function
class Fps_counter
{
protected:
	unsigned int m_fps;
	unsigned int m_fpscount;
	Interval m_fpsinterval;

public:
	Fps_counter() : m_fps(0), m_fpscount(0), m_fpsinterval(Interval()) {}

	void update()
	{
		// increase the counter by one
		m_fpscount++;

		// one second elapsed?
		if (m_fpsinterval.value() >= 1000000)
		{
			// save the current counter value to m_fps
			m_fps = m_fpscount;

			// reset the counter and the interval
			m_fpscount = 0;
			m_fpsinterval.reset();
		}
	}

	unsigned int get() const
	{
		if (m_fps == 0)
		{
			return m_fpscount;
		}

		return m_fps;
	}

	unsigned int getFrameCount() const
	{
		return m_fpscount;
	}
};