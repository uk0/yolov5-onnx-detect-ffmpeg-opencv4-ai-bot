// 实现Range类，用于遍历
//

#include <string>

class XRange {
public:

	// for(auto i:Range(1,10);  
	// 这个拆开就是这样:
	//      Range::RangeIterator it
	//      while( it != it.end() ) {
	//          i = *it
	//          it++
	//      }
	//
	// so,迭代器只需要支持操作符  * ++ !=  即可
	//

	class RangeIterator {
	public:
		explicit RangeIterator(long _var, long _step)
			: var(_var), step(_step) {
		}
		RangeIterator& operator++() {
			var += step;
			return *this;
		}
		long operator*() {
			return var;
		}
		bool operator!=(const RangeIterator& other) {
			// 递减时自身大于对比值
			if (step < 0)
				return (this->var > other.var);
			return (this->var < other.var);
		}
	private:
		long var, step;
	};


	//
	// Range类只需要提供 beigin() end() 成员函数(返回迭代器)
	//
	explicit XRange(long _begin, long _end, long _step = 1)
		: begin_var(_begin), end_var(_end), step(_step) {
	}
	RangeIterator begin() {
		return RangeIterator(begin_var, step);
	}
	RangeIterator end() {
		return RangeIterator(end_var, step);
	}

private:
	long begin_var, end_var, step;
};