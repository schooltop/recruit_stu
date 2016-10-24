#encoding:utf-8
class String
  def with_color(color)
    ["<span style='color:#{color}'>", self, "</span>"].join
  end

  def color_block(color, bgcolor)
    ["<span style='padding: 3px; font-size:9pt; background-color:#{bgcolor}; color:#{color};'>", self, "</span>"].join
  end

  def red
    with_color("red")
  end

  def bold
    ["<span style='font-weight:bold;'>", self, "</span>"].join
  end

  # 缩减
  def short(s=50)
     "<span style='clear: both;
    width: auto;
    word-break: break-word;
    word-wrap: break-word;
    white-space: -moz-pre-wrap;
    white-space: -hp-pre-wrap;
    white-space: -o-pre-wrap;
    white-space: -pre-wrap;
    white-space: pre;
    white-space: pre-wrap;
    white-space: pre-line;' data-toggle='tooltip' data-original-title='#{self}'>" + self[0..s] + "#{self.size > s ? '...' : '' }" + "</spand>"
  end
end

class Float

  #n 要保留的小数位数，flag=1 四舍五入 flag=0 不四舍五入
  def rounda(n, flag=1)
    y = 10.0 ** n
    if flag==1
      (self*y).round/y
    else
      (self*y).floor/y
    end
  end
end

class Time
  def label
    self.strftime("%Y-%m-%d %H:%M:%S")
  end

  def next_work_day(days = 1)
    start_date = self
    (1..(days*2)).each do
      start_date += 1.day
      unless [0, 6].include?(start_date.wday)
        days = days -1
      end
      break if days<=0
    end
    return start_date
  end

  def last_work_day(days = 1)
    start_date = self
    (1..(days*2)).each do
      start_date -= 1.day
      unless [0, 6].include?(start_date.wday)
        days = days - 1
      end
      break if days<=0
    end
    return start_date
  end

  def self.last_day_of_month(month, year = Time.now.year)
    mdays = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    mdays[2] = 29 if Date.leap?(year)
    last_day = mdays[month]
    Time.mktime(year, month, last_day)
  end

  def first_day_of_the_same_month
    Time.parse("#{self.year}-#{self.month}-01")
  end

  def last_day_of_the_same_month
    Time.last_day_of_month(self.month, self.year)
  end

  def format_date(type)
    case type
      when :full
        self.localtime.strftime("%Y-%m-%d %H:%M:%S")
      when :min
        self.strftime("%Y-%m-%d %H:%M")
      when :date
        self.localtime.strftime("%Y-%m-%d")
      when :reversal_date
        self.localtime.strftime("%d-%m-%Y")
      when :year
        self.strftime("%Y")
      when :month
        self.strftime("%Y年%m月份")
      when :quarter
        [self.strftime("%Y"), "年", [["第一", "第二", "第三", "第四"][(self.month-1)/3], "季度"]].join
    end
  end

  # 转换为当地时间+简短展示处理
  def local_default_time
    self.localtime.to_s(:humanized_ago)
  end

end

class Array

  def array_sum
    _sum = 0.0
    self.each { |a| _sum+=a.to_f }
    return _sum
  end

  def to_index_hash
    index_hash = {}
    self.each_with_index do |a,i|
      index_hash[a] = i
    end
    index_hash
  end

  def self_to_hash
    self.inject({}){|o,j| o[j]=j;o }
  end

  def array_average
    self.array_sum / self.size
  end

  def perm(n)
    if size < n or n < 0
    elsif n == 0
      yield([])
    else
      self[1..-1].perm(n - 1) do |x|
        (0...n).each do |i|
          yield(x[0...i] + [first] + x[i..-1])
        end
      end
      self[1..-1].perm(n) do |x|
        yield(x)
      end
    end
  end

  def comb(n)
    c = []
    self.perm(n) do |a|
      b = a.sort
      c << b unless c.include?(b)
    end
    c.each { |a| yield(a) }
  end

  def delete_once(v)
    self.each_with_index do |e, i|
      if e==v
        self[i] = nil
        break
      end
    end
    self.compact!
  end
end