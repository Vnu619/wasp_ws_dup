// Generated by gencpp from file wasp_joy/logistics.msg
// DO NOT EDIT!


#ifndef WASP_JOY_MESSAGE_LOGISTICS_H
#define WASP_JOY_MESSAGE_LOGISTICS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace wasp_joy
{
template <class ContainerAllocator>
struct logistics_
{
  typedef logistics_<ContainerAllocator> Type;

  logistics_()
    : liftup(0.0)
    , liftdown(0.0)
    , lifthome(0.0)
    , extrude(0.0)
    , intrude(0.0)  {
    }
  logistics_(const ContainerAllocator& _alloc)
    : liftup(0.0)
    , liftdown(0.0)
    , lifthome(0.0)
    , extrude(0.0)
    , intrude(0.0)  {
  (void)_alloc;
    }



   typedef double _liftup_type;
  _liftup_type liftup;

   typedef double _liftdown_type;
  _liftdown_type liftdown;

   typedef double _lifthome_type;
  _lifthome_type lifthome;

   typedef double _extrude_type;
  _extrude_type extrude;

   typedef double _intrude_type;
  _intrude_type intrude;





  typedef boost::shared_ptr< ::wasp_joy::logistics_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::wasp_joy::logistics_<ContainerAllocator> const> ConstPtr;

}; // struct logistics_

typedef ::wasp_joy::logistics_<std::allocator<void> > logistics;

typedef boost::shared_ptr< ::wasp_joy::logistics > logisticsPtr;
typedef boost::shared_ptr< ::wasp_joy::logistics const> logisticsConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::wasp_joy::logistics_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::wasp_joy::logistics_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::wasp_joy::logistics_<ContainerAllocator1> & lhs, const ::wasp_joy::logistics_<ContainerAllocator2> & rhs)
{
  return lhs.liftup == rhs.liftup &&
    lhs.liftdown == rhs.liftdown &&
    lhs.lifthome == rhs.lifthome &&
    lhs.extrude == rhs.extrude &&
    lhs.intrude == rhs.intrude;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::wasp_joy::logistics_<ContainerAllocator1> & lhs, const ::wasp_joy::logistics_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace wasp_joy

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::wasp_joy::logistics_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::wasp_joy::logistics_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wasp_joy::logistics_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::wasp_joy::logistics_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wasp_joy::logistics_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::wasp_joy::logistics_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::wasp_joy::logistics_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cab0a4435034735f1a142bf0d06c3d35";
  }

  static const char* value(const ::wasp_joy::logistics_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcab0a4435034735fULL;
  static const uint64_t static_value2 = 0x1a142bf0d06c3d35ULL;
};

template<class ContainerAllocator>
struct DataType< ::wasp_joy::logistics_<ContainerAllocator> >
{
  static const char* value()
  {
    return "wasp_joy/logistics";
  }

  static const char* value(const ::wasp_joy::logistics_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::wasp_joy::logistics_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 liftup\n"
"float64 liftdown\n"
"float64 lifthome\n"
"float64 extrude\n"
"float64 intrude\n"
;
  }

  static const char* value(const ::wasp_joy::logistics_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::wasp_joy::logistics_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.liftup);
      stream.next(m.liftdown);
      stream.next(m.lifthome);
      stream.next(m.extrude);
      stream.next(m.intrude);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct logistics_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::wasp_joy::logistics_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::wasp_joy::logistics_<ContainerAllocator>& v)
  {
    s << indent << "liftup: ";
    Printer<double>::stream(s, indent + "  ", v.liftup);
    s << indent << "liftdown: ";
    Printer<double>::stream(s, indent + "  ", v.liftdown);
    s << indent << "lifthome: ";
    Printer<double>::stream(s, indent + "  ", v.lifthome);
    s << indent << "extrude: ";
    Printer<double>::stream(s, indent + "  ", v.extrude);
    s << indent << "intrude: ";
    Printer<double>::stream(s, indent + "  ", v.intrude);
  }
};

} // namespace message_operations
} // namespace ros

#endif // WASP_JOY_MESSAGE_LOGISTICS_H
