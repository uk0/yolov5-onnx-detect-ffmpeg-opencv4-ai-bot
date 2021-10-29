// ʵ��Range�࣬���ڱ���
//

#include <string>

class XRange {
public:

	// for(auto i:Range(1,10);  
	// ����𿪾�������:
	//      Range::RangeIterator it
	//      while( it != it.end() ) {
	//          i = *it
	//          it++
	//      }
	//
	// so,������ֻ��Ҫ֧�ֲ�����  * ++ !=  ����
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
			// �ݼ�ʱ������ڶԱ�ֵ
			if (step < 0)
				return (this->var > other.var);
			return (this->var < other.var);
		}
	private:
		long var, step;
	};


	//
	// Range��ֻ��Ҫ�ṩ beigin() end() ��Ա����(���ص�����)
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