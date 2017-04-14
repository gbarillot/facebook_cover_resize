require 'test_helper'

class FacebookCoverResizeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FacebookCoverResize::VERSION
  end

  def test_large_image_no_offsets
    out = FacebookCoverResize.compute(original: [600, 800], offsets: [0, 0], width: 200)

    assert_equal [0, 0, 200, 267], out
  end

  def test_high_image_no_offsets
    out = FacebookCoverResize.compute(original: [600, 300], offsets: [0, 0], width: 200)

    assert_equal [0, -9, 210, 105], out
  end

  def test_small_image_no_offsets
    out = FacebookCoverResize.compute(original: [400, 300], offsets: [0, 0], width: 200)

    assert_equal [-45, 0, 200, 150], out
  end

  def test_square_image_no_offsets
    out = FacebookCoverResize.compute(original: [400, 400], offsets: [0, 0], width: 200)

    assert_equal [-95, 0, 200, 200], out
  end

  def test_large_image_offset_x
    out = FacebookCoverResize.compute(original: [600, 800], offsets: [50, 0], width: 200)

    assert_equal [0, 61, 79, 105], out
  end

  def test_large_image_offset_y
    out = FacebookCoverResize.compute(original: [600, 800], offsets: [0, 50], width: 200)

    assert_equal [-80, 0, 200, 267], out
  end

  def test_high_image_offset_x
    out = FacebookCoverResize.compute(original: [600, 300], offsets: [50, 0], width: 200)

    assert_equal [0, -4, 210, 105], out
  end

  def test_high_image_offset_y
    out = FacebookCoverResize.compute(original: [600, 300], offsets: [0, 50], width: 200)

    assert_equal [0, -4, 210, 105], out
  end

  def test_small_image_offset_x
    out = FacebookCoverResize.compute(original: [400, 300], offsets: [50, 0], width: 200)

    assert_equal [0, 31, 140, 105], out
  end

  def test_small_image_offset_y
    out = FacebookCoverResize.compute(original: [400, 300], offsets: [0, 50], width: 200)

    assert_equal [-22, 0, 200, 150], out
  end
end
