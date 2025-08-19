'use client'

import { useState } from 'react'
import { motion } from 'motion/react'
import { 
  BookOpen, 
  Calendar, 
  FileText, 
  MessageSquare, 
  User, 
  Info,
  ChevronRight
} from 'lucide-react'
import { Button } from './ui/button'
import { Avatar, AvatarFallback, AvatarImage } from './ui/avatar'
import skillFlowLogo from 'figma:asset/99ef82528f5cc48d72f7cfd3b8b72b1eb1d1a3ea.png'

const menuItems = [
  { icon: BookOpen, label: 'My Courses', active: true },
  { icon: Calendar, label: 'Schedule', active: false },
  { icon: FileText, label: 'Assignments', active: false },
  { icon: MessageSquare, label: 'Messages', active: false },
  { icon: User, label: 'Profile', active: false },
  { icon: Info, label: 'About us', active: false },
]

export function Sidebar() {
  const [hoveredItem, setHoveredItem] = useState<string | null>(null)

  return (
    <div className="w-64 bg-gradient-to-br from-pink-50 to-orange-50 border-r border-orange-100 h-screen flex flex-col">
      {/* Logo Section */}
      <div className="p-6 border-b border-orange-100">
        <motion.div 
          className="flex items-center gap-3 cursor-pointer"
          whileHover={{ scale: 1.02 }}
          whileTap={{ scale: 0.98 }}
        >
          <div className="w-20 h-20 flex items-center justify-center">
            <motion.img
              src={skillFlowLogo}
              alt="Skill Flow Logo"
              className="w-20 h-20 object-contain"
              whileHover={{ rotate: 5, scale: 1.05 }}
              transition={{ duration: 0.3 }}
            />
          </div>
          <div>
            <h2 className="text-orange-900">Skill Flow</h2>
            <p className="text-xs text-orange-600">Learning Management</p>
          </div>
        </motion.div>
      </div>

      {/* Navigation Menu */}
      <div className="flex-1 p-4 space-y-2">
        {menuItems.map((item, index) => (
          <motion.div
            key={item.label}
            className="relative"
            onHoverStart={() => setHoveredItem(item.label)}
            onHoverEnd={() => setHoveredItem(null)}
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: index * 0.1 }}
          >
            <Button
              variant="ghost"
              className={`
                w-full justify-start gap-3 p-3 h-auto relative overflow-hidden
                ${item.active 
                  ? 'bg-orange-100 text-orange-900 hover:bg-orange-200' 
                  : 'text-gray-700 hover:bg-orange-50 hover:text-orange-800'
                }
              `}
            >
              {/* Hover background effect */}
              {hoveredItem === item.label && !item.active && (
                <motion.div
                  className="absolute inset-0 bg-gradient-to-r from-orange-50 to-pink-50"
                  initial={{ opacity: 0, scale: 0.8 }}
                  animate={{ opacity: 1, scale: 1 }}
                  exit={{ opacity: 0, scale: 0.8 }}
                  transition={{ duration: 0.2 }}
                />
              )}
              
              {/* Active indicator */}
              {item.active && (
                <motion.div
                  className="absolute left-0 top-0 bottom-0 w-1 bg-gradient-to-b from-orange-400 to-red-500 rounded-r"
                  layoutId="activeIndicator"
                />
              )}
              
              <item.icon className="w-5 h-5 relative z-10" />
              <span className="relative z-10">{item.label}</span>
              <ChevronRight className={`
                w-4 h-4 ml-auto relative z-10 transition-transform duration-200
                ${hoveredItem === item.label ? 'translate-x-1' : ''}
              `} />
            </Button>
          </motion.div>
        ))}
      </div>

      {/* User Profile Section */}
      <motion.div 
        className="p-4 border-t border-orange-100"
        whileHover={{ backgroundColor: 'rgba(251, 146, 60, 0.1)' }}
      >
        <div className="flex items-center gap-3 p-3 rounded-lg cursor-pointer">
          <div className="relative">
            <Avatar className="w-10 h-10 border-2 border-orange-200">
              <AvatarImage src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=40&h=40&fit=crop&crop=face" />
              <AvatarFallback className="bg-orange-100 text-orange-700">UN</AvatarFallback>
            </Avatar>
            <div className="absolute -top-1 -right-1 w-4 h-4 bg-green-400 border-2 border-white rounded-full"></div>
          </div>
          <div className="flex-1">
            <p className="text-sm font-medium text-gray-900">User name</p>
            <p className="text-xs text-gray-500">Online</p>
          </div>
        </div>
      </motion.div>
    </div>
  )
}
