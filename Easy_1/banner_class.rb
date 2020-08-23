# Banner Class

# Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message, size=message.size+4)
    @message = message
    if size < message.size
      @size = message.size + 2
    else
      @size = size
    end
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    # first attempt:
    # dashes = '-' * (message_line.size - 2)
    # "+#{dashes}+"

    # second attempt:
    "+#{'-' * (@size - 2)}+"
  end

  def empty_line
    # first attempt:
    # spaces = ' ' * (message_line.size - 2)
    # "|#{spaces}|"

    # second attempt:
    "|#{' ' * (@size - 2)}|"
  end

  def message_gutter(s)
    ' ' * ((s - @message.size - 2) / 2)
  end

  def message_line
    "|#{message_gutter(@size) + @message + message_gutter(@size)}|"
  end
end

# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.', 20)
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+