<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingTol="1" simplifyAlgorithm="0" simplifyDrawingHints="1" labelsEnabled="0" simplifyMaxScale="1" minScale="1e+8" version="3.0.1-Girona" hasScaleBasedVisibilityFlag="0" readOnly="0" maxScale="0" simplifyLocal="1">
  <renderer-3d layer="QueryLayer_3_475fff0e_3c24_4143_9234_53662071b354" type="vector">
    <symbol type="line">
      <data height="0" extrusion-height="0" alt-binding="centroid" width="2" alt-clamping="relative"/>
      <material diffuse="179,179,179,255" specular="255,255,255,255" ambient="25,25,25,255" shininess="0"/>
    </symbol>
  </renderer-3d>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="RuleRenderer">
    <rules key="{7485a942-f3b4-4c37-9d54-f5de7195ffe8}">
      <rule filter="&quot;group_description&quot; = 'Car Optimistic' AND  &quot;mode&quot; = 'walk'" label="Car Optimistic" symbol="0" key="{2aee0711-ff2c-49f7-bdb4-f213fd0071d4}"/>
      <rule filter="&quot;group_description&quot; = 'Car Optimistic' AND &quot;mode&quot; = 'car'" label="Car Optimistic" symbol="1" key="{e136438f-5da4-49b8-848c-41b847648561}"/>
      <rule filter="&quot;group_description&quot; = 'Car Pessimistic' AND &quot;mode&quot; = 'walk'" label="Car Pessimistic" symbol="2" key="{277136ff-0ff7-4ee5-8467-fb123b9ab144}"/>
      <rule filter="&quot;group_description&quot; = 'Car Pessimistic' AND &quot;mode&quot; = 'car'" label="Car Pessimistic" symbol="3" key="{38460b81-2811-49d2-a4b3-705c17a40bd5}"/>
      <rule filter="&quot;group_description&quot; = 'Cycle' AND &quot;mode&quot; = 'walk'" label="Cycle" symbol="4" key="{dd161b2b-bf79-4fbd-83fd-e40b06d8a650}"/>
      <rule filter="&quot;group_description&quot; = 'Cycle' AND &quot;mode&quot; = 'cycle'" label="Cycle" symbol="5" key="{62822e6a-a620-4cba-b903-07822b313f44}"/>
      <rule filter="&quot;group_description&quot; = 'Public Transport' AND &quot;mode&quot; = 'walk'" label="Public Transport" symbol="6" key="{5fab0731-7980-4ee9-9e5c-e0786932568e}"/>
      <rule filter="&quot;group_description&quot; = 'Public Transport' AND &quot;mode&quot; IN ('bus', 'public transport')" label="Public Transport" symbol="7" key="{9366bf0e-4c3e-4cc8-b697-cf09bed9e097}"/>
      <rule filter="&quot;group_description&quot; = 'Walk'" label="Walk" symbol="8" key="{06558a43-e8d0-4105-aa75-8c86b9b7b0aa}"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" name="0" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="1" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="2" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="3" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="4" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="5" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dash dot dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="6" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="7" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dash"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" name="8" alpha="1" type="line">
        <layer locked="0" enabled="1" pass="0" class="SimpleLine">
          <prop k="capstyle" v="square"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="128,0,38,230"/>
          <prop k="line_style" v="dot"/>
          <prop k="line_width" v="1.06"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" name="name" type="QString"/>
              <Option name="properties"/>
              <Option value="collection" name="type" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <customproperties>
    <property value="id" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory penAlpha="255" height="15" labelPlacementMethod="XHeight" backgroundColor="#ffffff" sizeScale="3x:0,0,0,0,0,0" width="15" penColor="#000000" maxScaleDenominator="1e+8" opacity="1" lineSizeScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" barWidth="5" minimumSize="0" scaleDependency="Area" rotationOffset="270" backgroundAlpha="255" minScaleDenominator="0" penWidth="0" diagramOrientation="Up" enabled="0" sizeType="MM" lineSizeType="MM">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" linePlacementFlags="18" priority="0" zIndex="0" obstacle="0" placement="2">
    <properties>
      <Option type="Map">
        <Option value="" name="name" type="QString"/>
        <Option name="properties"/>
        <Option value="collection" name="type" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batch_run_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batch_item_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="group_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sub_group_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="group_description">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="mode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemsource">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemtarget">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemsourceway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemtargetway">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemsourcepos">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="itemtargetpos">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resseq">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resnodeid">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resedgeid">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="rescost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resgeom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resstreetname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="errmsg">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="resdelay">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="run_date">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batch_id">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batchname">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="batchdescription">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="highway">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="attrs">
      <editWidget type="KeyValue">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="source">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="target">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="built_up">
      <editWidget type="CheckBox">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_time">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="car_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="bus_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cycle_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="walk_reverse_cost_met">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="prev_geom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="next_geom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="firstnode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lastnode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="firstgroupnode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lastgroupnode">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="direction">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="startpoint">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="endpoint">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="time_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="met_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="time_agg_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="met_agg_cost">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="time_format">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="time_agg_format">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_minus_1sd_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_average_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_plus_1sd_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_minus_1sd_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_average_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="female_plus_1sd_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_minus_1sd_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_average_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_plus_1sd_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_minus_1sd_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_average_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="male_plus_1sd_agg_calories">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="batch_run_id" name="" index="1"/>
    <alias field="batch_item_id" name="" index="2"/>
    <alias field="group_id" name="" index="3"/>
    <alias field="sub_group_id" name="" index="4"/>
    <alias field="group_description" name="" index="5"/>
    <alias field="mode" name="" index="6"/>
    <alias field="itemsource" name="" index="7"/>
    <alias field="itemtarget" name="" index="8"/>
    <alias field="itemsourceway" name="" index="9"/>
    <alias field="itemtargetway" name="" index="10"/>
    <alias field="itemsourcepos" name="" index="11"/>
    <alias field="itemtargetpos" name="" index="12"/>
    <alias field="resseq" name="" index="13"/>
    <alias field="resnodeid" name="" index="14"/>
    <alias field="resedgeid" name="" index="15"/>
    <alias field="rescost" name="" index="16"/>
    <alias field="resgeom" name="" index="17"/>
    <alias field="resstreetname" name="" index="18"/>
    <alias field="errmsg" name="" index="19"/>
    <alias field="resdelay" name="" index="20"/>
    <alias field="run_date" name="" index="21"/>
    <alias field="batch_id" name="" index="22"/>
    <alias field="batchname" name="" index="23"/>
    <alias field="batchdescription" name="" index="24"/>
    <alias field="name" name="" index="25"/>
    <alias field="highway" name="" index="26"/>
    <alias field="attrs" name="" index="27"/>
    <alias field="source" name="" index="28"/>
    <alias field="target" name="" index="29"/>
    <alias field="built_up" name="" index="30"/>
    <alias field="car_cost_time" name="" index="31"/>
    <alias field="car_reverse_cost_time" name="" index="32"/>
    <alias field="bus_cost_time" name="" index="33"/>
    <alias field="bus_reverse_cost_time" name="" index="34"/>
    <alias field="cycle_cost_time" name="" index="35"/>
    <alias field="cycle_reverse_cost_time" name="" index="36"/>
    <alias field="walk_cost_time" name="" index="37"/>
    <alias field="walk_reverse_cost_time" name="" index="38"/>
    <alias field="car_cost_met" name="" index="39"/>
    <alias field="car_reverse_cost_met" name="" index="40"/>
    <alias field="bus_cost_met" name="" index="41"/>
    <alias field="bus_reverse_cost_met" name="" index="42"/>
    <alias field="cycle_cost_met" name="" index="43"/>
    <alias field="cycle_reverse_cost_met" name="" index="44"/>
    <alias field="walk_cost_met" name="" index="45"/>
    <alias field="walk_reverse_cost_met" name="" index="46"/>
    <alias field="prev_geom" name="" index="47"/>
    <alias field="next_geom" name="" index="48"/>
    <alias field="firstnode" name="" index="49"/>
    <alias field="lastnode" name="" index="50"/>
    <alias field="firstgroupnode" name="" index="51"/>
    <alias field="lastgroupnode" name="" index="52"/>
    <alias field="direction" name="" index="53"/>
    <alias field="startpoint" name="" index="54"/>
    <alias field="endpoint" name="" index="55"/>
    <alias field="time_cost" name="" index="56"/>
    <alias field="met_cost" name="" index="57"/>
    <alias field="time_agg_cost" name="" index="58"/>
    <alias field="met_agg_cost" name="" index="59"/>
    <alias field="time_format" name="" index="60"/>
    <alias field="time_agg_format" name="" index="61"/>
    <alias field="female_minus_1sd_calories" name="" index="62"/>
    <alias field="female_average_calories" name="" index="63"/>
    <alias field="female_plus_1sd_calories" name="" index="64"/>
    <alias field="female_minus_1sd_agg_calories" name="" index="65"/>
    <alias field="female_average_agg_calories" name="" index="66"/>
    <alias field="female_plus_1sd_agg_calories" name="" index="67"/>
    <alias field="male_minus_1sd_calories" name="" index="68"/>
    <alias field="male_average_calories" name="" index="69"/>
    <alias field="male_plus_1sd_calories" name="" index="70"/>
    <alias field="male_minus_1sd_agg_calories" name="" index="71"/>
    <alias field="male_average_agg_calories" name="" index="72"/>
    <alias field="male_plus_1sd_agg_calories" name="" index="73"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="" field="batch_run_id" applyOnUpdate="0"/>
    <default expression="" field="batch_item_id" applyOnUpdate="0"/>
    <default expression="" field="group_id" applyOnUpdate="0"/>
    <default expression="" field="sub_group_id" applyOnUpdate="0"/>
    <default expression="" field="group_description" applyOnUpdate="0"/>
    <default expression="" field="mode" applyOnUpdate="0"/>
    <default expression="" field="itemsource" applyOnUpdate="0"/>
    <default expression="" field="itemtarget" applyOnUpdate="0"/>
    <default expression="" field="itemsourceway" applyOnUpdate="0"/>
    <default expression="" field="itemtargetway" applyOnUpdate="0"/>
    <default expression="" field="itemsourcepos" applyOnUpdate="0"/>
    <default expression="" field="itemtargetpos" applyOnUpdate="0"/>
    <default expression="" field="resseq" applyOnUpdate="0"/>
    <default expression="" field="resnodeid" applyOnUpdate="0"/>
    <default expression="" field="resedgeid" applyOnUpdate="0"/>
    <default expression="" field="rescost" applyOnUpdate="0"/>
    <default expression="" field="resgeom" applyOnUpdate="0"/>
    <default expression="" field="resstreetname" applyOnUpdate="0"/>
    <default expression="" field="errmsg" applyOnUpdate="0"/>
    <default expression="" field="resdelay" applyOnUpdate="0"/>
    <default expression="" field="run_date" applyOnUpdate="0"/>
    <default expression="" field="batch_id" applyOnUpdate="0"/>
    <default expression="" field="batchname" applyOnUpdate="0"/>
    <default expression="" field="batchdescription" applyOnUpdate="0"/>
    <default expression="" field="name" applyOnUpdate="0"/>
    <default expression="" field="highway" applyOnUpdate="0"/>
    <default expression="" field="attrs" applyOnUpdate="0"/>
    <default expression="" field="source" applyOnUpdate="0"/>
    <default expression="" field="target" applyOnUpdate="0"/>
    <default expression="" field="built_up" applyOnUpdate="0"/>
    <default expression="" field="car_cost_time" applyOnUpdate="0"/>
    <default expression="" field="car_reverse_cost_time" applyOnUpdate="0"/>
    <default expression="" field="bus_cost_time" applyOnUpdate="0"/>
    <default expression="" field="bus_reverse_cost_time" applyOnUpdate="0"/>
    <default expression="" field="cycle_cost_time" applyOnUpdate="0"/>
    <default expression="" field="cycle_reverse_cost_time" applyOnUpdate="0"/>
    <default expression="" field="walk_cost_time" applyOnUpdate="0"/>
    <default expression="" field="walk_reverse_cost_time" applyOnUpdate="0"/>
    <default expression="" field="car_cost_met" applyOnUpdate="0"/>
    <default expression="" field="car_reverse_cost_met" applyOnUpdate="0"/>
    <default expression="" field="bus_cost_met" applyOnUpdate="0"/>
    <default expression="" field="bus_reverse_cost_met" applyOnUpdate="0"/>
    <default expression="" field="cycle_cost_met" applyOnUpdate="0"/>
    <default expression="" field="cycle_reverse_cost_met" applyOnUpdate="0"/>
    <default expression="" field="walk_cost_met" applyOnUpdate="0"/>
    <default expression="" field="walk_reverse_cost_met" applyOnUpdate="0"/>
    <default expression="" field="prev_geom" applyOnUpdate="0"/>
    <default expression="" field="next_geom" applyOnUpdate="0"/>
    <default expression="" field="firstnode" applyOnUpdate="0"/>
    <default expression="" field="lastnode" applyOnUpdate="0"/>
    <default expression="" field="firstgroupnode" applyOnUpdate="0"/>
    <default expression="" field="lastgroupnode" applyOnUpdate="0"/>
    <default expression="" field="direction" applyOnUpdate="0"/>
    <default expression="" field="startpoint" applyOnUpdate="0"/>
    <default expression="" field="endpoint" applyOnUpdate="0"/>
    <default expression="" field="time_cost" applyOnUpdate="0"/>
    <default expression="" field="met_cost" applyOnUpdate="0"/>
    <default expression="" field="time_agg_cost" applyOnUpdate="0"/>
    <default expression="" field="met_agg_cost" applyOnUpdate="0"/>
    <default expression="" field="time_format" applyOnUpdate="0"/>
    <default expression="" field="time_agg_format" applyOnUpdate="0"/>
    <default expression="" field="female_minus_1sd_calories" applyOnUpdate="0"/>
    <default expression="" field="female_average_calories" applyOnUpdate="0"/>
    <default expression="" field="female_plus_1sd_calories" applyOnUpdate="0"/>
    <default expression="" field="female_minus_1sd_agg_calories" applyOnUpdate="0"/>
    <default expression="" field="female_average_agg_calories" applyOnUpdate="0"/>
    <default expression="" field="female_plus_1sd_agg_calories" applyOnUpdate="0"/>
    <default expression="" field="male_minus_1sd_calories" applyOnUpdate="0"/>
    <default expression="" field="male_average_calories" applyOnUpdate="0"/>
    <default expression="" field="male_plus_1sd_calories" applyOnUpdate="0"/>
    <default expression="" field="male_minus_1sd_agg_calories" applyOnUpdate="0"/>
    <default expression="" field="male_average_agg_calories" applyOnUpdate="0"/>
    <default expression="" field="male_plus_1sd_agg_calories" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" exp_strength="0" field="id" unique_strength="1"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="batch_run_id" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="batch_item_id" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="group_id" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="sub_group_id" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="group_description" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="mode" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemsource" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemtarget" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemsourceway" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemtargetway" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemsourcepos" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="itemtargetpos" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resseq" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resnodeid" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resedgeid" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="rescost" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resgeom" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resstreetname" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="errmsg" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="resdelay" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="run_date" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="batch_id" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="batchname" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="batchdescription" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="name" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="highway" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="attrs" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="source" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="target" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="built_up" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="car_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="car_reverse_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="bus_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="bus_reverse_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="cycle_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="cycle_reverse_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="walk_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="walk_reverse_cost_time" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="car_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="car_reverse_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="bus_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="bus_reverse_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="cycle_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="cycle_reverse_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="walk_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="walk_reverse_cost_met" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="prev_geom" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="next_geom" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="firstnode" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="lastnode" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="firstgroupnode" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="lastgroupnode" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="direction" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="startpoint" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="endpoint" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="time_cost" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="met_cost" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="time_agg_cost" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="met_agg_cost" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="time_format" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="time_agg_format" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_minus_1sd_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_average_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_plus_1sd_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_minus_1sd_agg_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_average_agg_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="female_plus_1sd_agg_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_minus_1sd_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_average_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_plus_1sd_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_minus_1sd_agg_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_average_agg_calories" unique_strength="0"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" field="male_plus_1sd_agg_calories" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="id" desc=""/>
    <constraint exp="" field="batch_run_id" desc=""/>
    <constraint exp="" field="batch_item_id" desc=""/>
    <constraint exp="" field="group_id" desc=""/>
    <constraint exp="" field="sub_group_id" desc=""/>
    <constraint exp="" field="group_description" desc=""/>
    <constraint exp="" field="mode" desc=""/>
    <constraint exp="" field="itemsource" desc=""/>
    <constraint exp="" field="itemtarget" desc=""/>
    <constraint exp="" field="itemsourceway" desc=""/>
    <constraint exp="" field="itemtargetway" desc=""/>
    <constraint exp="" field="itemsourcepos" desc=""/>
    <constraint exp="" field="itemtargetpos" desc=""/>
    <constraint exp="" field="resseq" desc=""/>
    <constraint exp="" field="resnodeid" desc=""/>
    <constraint exp="" field="resedgeid" desc=""/>
    <constraint exp="" field="rescost" desc=""/>
    <constraint exp="" field="resgeom" desc=""/>
    <constraint exp="" field="resstreetname" desc=""/>
    <constraint exp="" field="errmsg" desc=""/>
    <constraint exp="" field="resdelay" desc=""/>
    <constraint exp="" field="run_date" desc=""/>
    <constraint exp="" field="batch_id" desc=""/>
    <constraint exp="" field="batchname" desc=""/>
    <constraint exp="" field="batchdescription" desc=""/>
    <constraint exp="" field="name" desc=""/>
    <constraint exp="" field="highway" desc=""/>
    <constraint exp="" field="attrs" desc=""/>
    <constraint exp="" field="source" desc=""/>
    <constraint exp="" field="target" desc=""/>
    <constraint exp="" field="built_up" desc=""/>
    <constraint exp="" field="car_cost_time" desc=""/>
    <constraint exp="" field="car_reverse_cost_time" desc=""/>
    <constraint exp="" field="bus_cost_time" desc=""/>
    <constraint exp="" field="bus_reverse_cost_time" desc=""/>
    <constraint exp="" field="cycle_cost_time" desc=""/>
    <constraint exp="" field="cycle_reverse_cost_time" desc=""/>
    <constraint exp="" field="walk_cost_time" desc=""/>
    <constraint exp="" field="walk_reverse_cost_time" desc=""/>
    <constraint exp="" field="car_cost_met" desc=""/>
    <constraint exp="" field="car_reverse_cost_met" desc=""/>
    <constraint exp="" field="bus_cost_met" desc=""/>
    <constraint exp="" field="bus_reverse_cost_met" desc=""/>
    <constraint exp="" field="cycle_cost_met" desc=""/>
    <constraint exp="" field="cycle_reverse_cost_met" desc=""/>
    <constraint exp="" field="walk_cost_met" desc=""/>
    <constraint exp="" field="walk_reverse_cost_met" desc=""/>
    <constraint exp="" field="prev_geom" desc=""/>
    <constraint exp="" field="next_geom" desc=""/>
    <constraint exp="" field="firstnode" desc=""/>
    <constraint exp="" field="lastnode" desc=""/>
    <constraint exp="" field="firstgroupnode" desc=""/>
    <constraint exp="" field="lastgroupnode" desc=""/>
    <constraint exp="" field="direction" desc=""/>
    <constraint exp="" field="startpoint" desc=""/>
    <constraint exp="" field="endpoint" desc=""/>
    <constraint exp="" field="time_cost" desc=""/>
    <constraint exp="" field="met_cost" desc=""/>
    <constraint exp="" field="time_agg_cost" desc=""/>
    <constraint exp="" field="met_agg_cost" desc=""/>
    <constraint exp="" field="time_format" desc=""/>
    <constraint exp="" field="time_agg_format" desc=""/>
    <constraint exp="" field="female_minus_1sd_calories" desc=""/>
    <constraint exp="" field="female_average_calories" desc=""/>
    <constraint exp="" field="female_plus_1sd_calories" desc=""/>
    <constraint exp="" field="female_minus_1sd_agg_calories" desc=""/>
    <constraint exp="" field="female_average_agg_calories" desc=""/>
    <constraint exp="" field="female_plus_1sd_agg_calories" desc=""/>
    <constraint exp="" field="male_minus_1sd_calories" desc=""/>
    <constraint exp="" field="male_average_calories" desc=""/>
    <constraint exp="" field="male_plus_1sd_calories" desc=""/>
    <constraint exp="" field="male_minus_1sd_agg_calories" desc=""/>
    <constraint exp="" field="male_average_agg_calories" desc=""/>
    <constraint exp="" field="male_plus_1sd_agg_calories" desc=""/>
  </constraintExpressions>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column name="id" width="-1" hidden="0" type="field"/>
      <column name="batch_run_id" width="-1" hidden="0" type="field"/>
      <column name="batch_item_id" width="-1" hidden="0" type="field"/>
      <column name="group_id" width="-1" hidden="0" type="field"/>
      <column name="sub_group_id" width="-1" hidden="0" type="field"/>
      <column name="group_description" width="-1" hidden="0" type="field"/>
      <column name="mode" width="-1" hidden="0" type="field"/>
      <column name="itemsource" width="-1" hidden="0" type="field"/>
      <column name="itemtarget" width="-1" hidden="0" type="field"/>
      <column name="itemsourceway" width="-1" hidden="0" type="field"/>
      <column name="itemtargetway" width="-1" hidden="0" type="field"/>
      <column name="itemsourcepos" width="-1" hidden="0" type="field"/>
      <column name="itemtargetpos" width="-1" hidden="0" type="field"/>
      <column name="resseq" width="-1" hidden="0" type="field"/>
      <column name="resnodeid" width="-1" hidden="0" type="field"/>
      <column name="resedgeid" width="-1" hidden="0" type="field"/>
      <column name="rescost" width="-1" hidden="0" type="field"/>
      <column name="resgeom" width="-1" hidden="0" type="field"/>
      <column name="resstreetname" width="-1" hidden="0" type="field"/>
      <column name="errmsg" width="-1" hidden="0" type="field"/>
      <column name="resdelay" width="-1" hidden="0" type="field"/>
      <column name="run_date" width="-1" hidden="0" type="field"/>
      <column name="batch_id" width="-1" hidden="0" type="field"/>
      <column name="batchname" width="-1" hidden="0" type="field"/>
      <column name="batchdescription" width="-1" hidden="0" type="field"/>
      <column name="name" width="-1" hidden="0" type="field"/>
      <column name="highway" width="-1" hidden="0" type="field"/>
      <column name="attrs" width="-1" hidden="0" type="field"/>
      <column name="source" width="-1" hidden="0" type="field"/>
      <column name="target" width="-1" hidden="0" type="field"/>
      <column name="built_up" width="-1" hidden="0" type="field"/>
      <column name="car_cost_time" width="-1" hidden="0" type="field"/>
      <column name="car_reverse_cost_time" width="-1" hidden="0" type="field"/>
      <column name="bus_cost_time" width="-1" hidden="0" type="field"/>
      <column name="bus_reverse_cost_time" width="-1" hidden="0" type="field"/>
      <column name="cycle_cost_time" width="-1" hidden="0" type="field"/>
      <column name="cycle_reverse_cost_time" width="-1" hidden="0" type="field"/>
      <column name="walk_cost_time" width="-1" hidden="0" type="field"/>
      <column name="walk_reverse_cost_time" width="-1" hidden="0" type="field"/>
      <column name="car_cost_met" width="-1" hidden="0" type="field"/>
      <column name="car_reverse_cost_met" width="-1" hidden="0" type="field"/>
      <column name="bus_cost_met" width="-1" hidden="0" type="field"/>
      <column name="bus_reverse_cost_met" width="-1" hidden="0" type="field"/>
      <column name="cycle_cost_met" width="-1" hidden="0" type="field"/>
      <column name="cycle_reverse_cost_met" width="-1" hidden="0" type="field"/>
      <column name="walk_cost_met" width="-1" hidden="0" type="field"/>
      <column name="walk_reverse_cost_met" width="-1" hidden="0" type="field"/>
      <column name="prev_geom" width="-1" hidden="0" type="field"/>
      <column name="next_geom" width="-1" hidden="0" type="field"/>
      <column name="firstnode" width="-1" hidden="0" type="field"/>
      <column name="lastnode" width="-1" hidden="0" type="field"/>
      <column name="firstgroupnode" width="-1" hidden="0" type="field"/>
      <column name="lastgroupnode" width="-1" hidden="0" type="field"/>
      <column name="direction" width="-1" hidden="0" type="field"/>
      <column name="startpoint" width="-1" hidden="0" type="field"/>
      <column name="endpoint" width="-1" hidden="0" type="field"/>
      <column name="time_cost" width="-1" hidden="0" type="field"/>
      <column name="met_cost" width="-1" hidden="0" type="field"/>
      <column name="time_agg_cost" width="-1" hidden="0" type="field"/>
      <column name="met_agg_cost" width="-1" hidden="0" type="field"/>
      <column name="time_format" width="-1" hidden="0" type="field"/>
      <column name="time_agg_format" width="-1" hidden="0" type="field"/>
      <column name="female_minus_1sd_calories" width="-1" hidden="0" type="field"/>
      <column name="female_average_calories" width="-1" hidden="0" type="field"/>
      <column name="female_plus_1sd_calories" width="-1" hidden="0" type="field"/>
      <column name="female_minus_1sd_agg_calories" width="-1" hidden="0" type="field"/>
      <column name="female_average_agg_calories" width="-1" hidden="0" type="field"/>
      <column name="female_plus_1sd_agg_calories" width="-1" hidden="0" type="field"/>
      <column name="male_minus_1sd_calories" width="-1" hidden="0" type="field"/>
      <column name="male_average_calories" width="-1" hidden="0" type="field"/>
      <column name="male_plus_1sd_calories" width="-1" hidden="0" type="field"/>
      <column name="male_minus_1sd_agg_calories" width="-1" hidden="0" type="field"/>
      <column name="male_average_agg_calories" width="-1" hidden="0" type="field"/>
      <column name="male_plus_1sd_agg_calories" width="-1" hidden="0" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <editform>D:/Users/sbent/OneDrive/Data/PhD/Sheffield</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="attrs" editable="1"/>
    <field name="batch_id" editable="1"/>
    <field name="batch_item_id" editable="1"/>
    <field name="batch_run_id" editable="1"/>
    <field name="batchdescription" editable="1"/>
    <field name="batchname" editable="1"/>
    <field name="built_up" editable="1"/>
    <field name="bus_cost_met" editable="1"/>
    <field name="bus_cost_time" editable="1"/>
    <field name="bus_reverse_cost_met" editable="1"/>
    <field name="bus_reverse_cost_time" editable="1"/>
    <field name="car_cost_met" editable="1"/>
    <field name="car_cost_time" editable="1"/>
    <field name="car_reverse_cost_met" editable="1"/>
    <field name="car_reverse_cost_time" editable="1"/>
    <field name="cycle_cost_met" editable="1"/>
    <field name="cycle_cost_time" editable="1"/>
    <field name="cycle_reverse_cost_met" editable="1"/>
    <field name="cycle_reverse_cost_time" editable="1"/>
    <field name="direction" editable="1"/>
    <field name="endpoint" editable="1"/>
    <field name="errmsg" editable="1"/>
    <field name="female_average_agg_calories" editable="1"/>
    <field name="female_average_calories" editable="1"/>
    <field name="female_minus_1sd_agg_calories" editable="1"/>
    <field name="female_minus_1sd_calories" editable="1"/>
    <field name="female_plus_1sd_agg_calories" editable="1"/>
    <field name="female_plus_1sd_calories" editable="1"/>
    <field name="firstgroupnode" editable="1"/>
    <field name="firstnode" editable="1"/>
    <field name="group_description" editable="1"/>
    <field name="group_id" editable="1"/>
    <field name="highway" editable="1"/>
    <field name="id" editable="1"/>
    <field name="itemsource" editable="1"/>
    <field name="itemsourcepos" editable="1"/>
    <field name="itemsourceway" editable="1"/>
    <field name="itemtarget" editable="1"/>
    <field name="itemtargetpos" editable="1"/>
    <field name="itemtargetway" editable="1"/>
    <field name="lastgroupnode" editable="1"/>
    <field name="lastnode" editable="1"/>
    <field name="male_average_agg_calories" editable="1"/>
    <field name="male_average_calories" editable="1"/>
    <field name="male_minus_1sd_agg_calories" editable="1"/>
    <field name="male_minus_1sd_calories" editable="1"/>
    <field name="male_plus_1sd_agg_calories" editable="1"/>
    <field name="male_plus_1sd_calories" editable="1"/>
    <field name="met_agg_cost" editable="1"/>
    <field name="met_cost" editable="1"/>
    <field name="mode" editable="1"/>
    <field name="name" editable="1"/>
    <field name="next_geom" editable="1"/>
    <field name="prev_geom" editable="1"/>
    <field name="rescost" editable="1"/>
    <field name="resdelay" editable="1"/>
    <field name="resedgeid" editable="1"/>
    <field name="resgeom" editable="1"/>
    <field name="resnodeid" editable="1"/>
    <field name="resseq" editable="1"/>
    <field name="resstreetname" editable="1"/>
    <field name="run_date" editable="1"/>
    <field name="source" editable="1"/>
    <field name="startpoint" editable="1"/>
    <field name="sub_group_id" editable="1"/>
    <field name="target" editable="1"/>
    <field name="time_agg_cost" editable="1"/>
    <field name="time_agg_format" editable="1"/>
    <field name="time_cost" editable="1"/>
    <field name="time_format" editable="1"/>
    <field name="walk_cost_met" editable="1"/>
    <field name="walk_cost_time" editable="1"/>
    <field name="walk_reverse_cost_met" editable="1"/>
    <field name="walk_reverse_cost_time" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="attrs" labelOnTop="0"/>
    <field name="batch_id" labelOnTop="0"/>
    <field name="batch_item_id" labelOnTop="0"/>
    <field name="batch_run_id" labelOnTop="0"/>
    <field name="batchdescription" labelOnTop="0"/>
    <field name="batchname" labelOnTop="0"/>
    <field name="built_up" labelOnTop="0"/>
    <field name="bus_cost_met" labelOnTop="0"/>
    <field name="bus_cost_time" labelOnTop="0"/>
    <field name="bus_reverse_cost_met" labelOnTop="0"/>
    <field name="bus_reverse_cost_time" labelOnTop="0"/>
    <field name="car_cost_met" labelOnTop="0"/>
    <field name="car_cost_time" labelOnTop="0"/>
    <field name="car_reverse_cost_met" labelOnTop="0"/>
    <field name="car_reverse_cost_time" labelOnTop="0"/>
    <field name="cycle_cost_met" labelOnTop="0"/>
    <field name="cycle_cost_time" labelOnTop="0"/>
    <field name="cycle_reverse_cost_met" labelOnTop="0"/>
    <field name="cycle_reverse_cost_time" labelOnTop="0"/>
    <field name="direction" labelOnTop="0"/>
    <field name="endpoint" labelOnTop="0"/>
    <field name="errmsg" labelOnTop="0"/>
    <field name="female_average_agg_calories" labelOnTop="0"/>
    <field name="female_average_calories" labelOnTop="0"/>
    <field name="female_minus_1sd_agg_calories" labelOnTop="0"/>
    <field name="female_minus_1sd_calories" labelOnTop="0"/>
    <field name="female_plus_1sd_agg_calories" labelOnTop="0"/>
    <field name="female_plus_1sd_calories" labelOnTop="0"/>
    <field name="firstgroupnode" labelOnTop="0"/>
    <field name="firstnode" labelOnTop="0"/>
    <field name="group_description" labelOnTop="0"/>
    <field name="group_id" labelOnTop="0"/>
    <field name="highway" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="itemsource" labelOnTop="0"/>
    <field name="itemsourcepos" labelOnTop="0"/>
    <field name="itemsourceway" labelOnTop="0"/>
    <field name="itemtarget" labelOnTop="0"/>
    <field name="itemtargetpos" labelOnTop="0"/>
    <field name="itemtargetway" labelOnTop="0"/>
    <field name="lastgroupnode" labelOnTop="0"/>
    <field name="lastnode" labelOnTop="0"/>
    <field name="male_average_agg_calories" labelOnTop="0"/>
    <field name="male_average_calories" labelOnTop="0"/>
    <field name="male_minus_1sd_agg_calories" labelOnTop="0"/>
    <field name="male_minus_1sd_calories" labelOnTop="0"/>
    <field name="male_plus_1sd_agg_calories" labelOnTop="0"/>
    <field name="male_plus_1sd_calories" labelOnTop="0"/>
    <field name="met_agg_cost" labelOnTop="0"/>
    <field name="met_cost" labelOnTop="0"/>
    <field name="mode" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="next_geom" labelOnTop="0"/>
    <field name="prev_geom" labelOnTop="0"/>
    <field name="rescost" labelOnTop="0"/>
    <field name="resdelay" labelOnTop="0"/>
    <field name="resedgeid" labelOnTop="0"/>
    <field name="resgeom" labelOnTop="0"/>
    <field name="resnodeid" labelOnTop="0"/>
    <field name="resseq" labelOnTop="0"/>
    <field name="resstreetname" labelOnTop="0"/>
    <field name="run_date" labelOnTop="0"/>
    <field name="source" labelOnTop="0"/>
    <field name="startpoint" labelOnTop="0"/>
    <field name="sub_group_id" labelOnTop="0"/>
    <field name="target" labelOnTop="0"/>
    <field name="time_agg_cost" labelOnTop="0"/>
    <field name="time_agg_format" labelOnTop="0"/>
    <field name="time_cost" labelOnTop="0"/>
    <field name="time_format" labelOnTop="0"/>
    <field name="walk_cost_met" labelOnTop="0"/>
    <field name="walk_cost_time" labelOnTop="0"/>
    <field name="walk_reverse_cost_met" labelOnTop="0"/>
    <field name="walk_reverse_cost_time" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <expressionfields/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
