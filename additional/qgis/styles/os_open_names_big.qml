<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.6.0-Noosa" simplifyDrawingHints="0" simplifyDrawingTol="1" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyMaxScale="1" readOnly="0" simplifyLocal="1" labelsEnabled="1" minScale="1e+08" maxScale="-4.65661e-10">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="singleSymbol" enableorderby="0">
    <symbols>
      <symbol type="marker" clip_to_extent="1" force_rhr="0" name="0" alpha="1">
        <layer enabled="1" locked="0" pass="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.4" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="size">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="CASE WHEN &quot;sub_type&quot; IN ('City', 'Town') THEN 2.0 ELSE 0.0 END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="rule-based">
    <rules key="{f0cc5abd-4931-412b-b635-742b2cd01963}">
      <rule description="City_Town" scalemindenom="30000" scalemaxdenom="1000000" filter=" &quot;sub_type&quot; IN ('City', 'Town')" key="{cd4fa113-cd41-4758-9abe-dbeb72691769}">
        <settings>
          <text-style fontItalic="0" fontSize="5" fontCapitals="0" fontFamily="Calibri" fontStrikeout="0" fontSizeUnit="MapUnit" fontSizeMapUnitScale="3x:0,0,0,0,0,0" isExpression="0" namedStyle="Regular" textColor="0,0,0,255" previewBkgrdColor="#ffffff" fontWordSpacing="0" blendMode="0" fieldName="name" textOpacity="1" fontUnderline="0" fontWeight="50" fontLetterSpacing="0" multilineHeight="1" useSubstitutions="0">
            <text-buffer bufferNoFill="1" bufferSize="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeUnits="MM" bufferJoinStyle="128" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="1"/>
            <background shapeDraw="0" shapeSVGFile="" shapeRadiiX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeSizeY="0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeBlendMode="0" shapeRotation="0" shapeRadiiY="0" shapeBorderWidthUnit="MM" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeSizeType="0" shapeType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidth="0" shapeSizeX="0" shapeJoinStyle="64" shapeSizeUnit="MM"/>
            <shadow shadowScale="100" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOpacity="0.7" shadowDraw="0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0" shadowOffsetGlobal="1"/>
            <substitutions/>
          </text-style>
          <text-format rightDirectionSymbol=">" decimals="3" autoWrapLength="0" plussign="0" reverseDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" wrapChar="" multilineAlign="3" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0"/>
          <placement placement="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" priority="5" offsetType="0" distUnits="MM" placementFlags="10" xOffset="0" quadOffset="4" maxCurvedCharAngleOut="-25" distMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM" preserveRotation="1" rotationAngle="0" fitInPolygonOnly="0" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" yOffset="0" repeatDistance="0"/>
          <rendering fontMaxPixelSize="10000" obstacle="0" scaleVisibility="0" limitNumLabels="0" obstacleType="0" scaleMax="1000000" fontLimitPixelSize="0" zIndex="0" minFeatureSize="0" scaleMin="30000" drawLabels="1" fontMinPixelSize="3" displayAll="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" mergeLines="0" upsidedownLabels="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="Size">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="max(@map_scale / 150, 150)"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
      <rule description="Everything" scalemindenom="1" scalemaxdenom="30000" filter=" &quot;sub_type&quot; IS NOT NULL" key="{5b51e601-44f3-4491-ac71-0a67d834acae}">
        <settings>
          <text-style fontItalic="0" fontSize="28" fontCapitals="0" fontFamily="Calibri" fontStrikeout="0" fontSizeUnit="MapUnit" fontSizeMapUnitScale="3x:0,0,0,0,0,0" isExpression="0" namedStyle="Regular" textColor="0,0,0,255" previewBkgrdColor="#ffffff" fontWordSpacing="0" blendMode="0" fieldName="name" textOpacity="1" fontUnderline="0" fontWeight="50" fontLetterSpacing="0" multilineHeight="1" useSubstitutions="0">
            <text-buffer bufferNoFill="1" bufferSize="1" bufferOpacity="1" bufferBlendMode="0" bufferSizeUnits="MM" bufferJoinStyle="128" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferDraw="1"/>
            <background shapeDraw="0" shapeSVGFile="" shapeRadiiX="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOpacity="1" shapeSizeY="0" shapeOffsetUnit="MM" shapeOffsetX="0" shapeBlendMode="0" shapeRotation="0" shapeRadiiY="0" shapeBorderWidthUnit="MM" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeSizeType="0" shapeType="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeBorderWidth="0" shapeSizeX="0" shapeJoinStyle="64" shapeSizeUnit="MM"/>
            <shadow shadowScale="100" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOpacity="0.7" shadowDraw="0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0" shadowOffsetGlobal="1"/>
            <substitutions/>
          </text-style>
          <text-format rightDirectionSymbol=">" decimals="3" autoWrapLength="0" plussign="0" reverseDirectionSymbol="0" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" wrapChar="" multilineAlign="3" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0"/>
          <placement placement="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" priority="5" offsetType="0" distUnits="MM" placementFlags="10" xOffset="0" quadOffset="4" maxCurvedCharAngleOut="-25" distMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MM" preserveRotation="1" rotationAngle="0" fitInPolygonOnly="0" maxCurvedCharAngleIn="25" repeatDistanceUnits="MM" yOffset="0" repeatDistance="0"/>
          <rendering fontMaxPixelSize="10000" obstacle="0" scaleVisibility="0" limitNumLabels="0" obstacleType="0" scaleMax="1000000" fontLimitPixelSize="0" zIndex="0" minFeatureSize="0" scaleMin="30000" drawLabels="1" fontMinPixelSize="3" displayAll="1" maxNumLabels="2000" labelPerPart="0" obstacleFactor="1" mergeLines="0" upsidedownLabels="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="Size">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="max(@map_scale / 250, 28)"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </dd_properties>
        </settings>
      </rule>
    </rules>
  </labeling>
  <customproperties>
    <property value="name" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory minScaleDenominator="-4.65661e-10" lineSizeType="MM" scaleBasedVisibility="0" width="15" penColor="#000000" labelPlacementMethod="XHeight" penWidth="0" height="15" barWidth="5" sizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" enabled="0" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" backgroundAlpha="255" penAlpha="255" scaleDependency="Area" backgroundColor="#ffffff" maxScaleDenominator="1e+08" diagramOrientation="Up" opacity="1">
      <fontProperties style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings placement="0" zIndex="0" showAll="1" priority="0" obstacle="0" linePlacementFlags="18" dist="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
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
    <field name="type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="sub_type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="outcode">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="id"/>
    <alias name="" index="1" field="name"/>
    <alias name="" index="2" field="type"/>
    <alias name="" index="3" field="sub_type"/>
    <alias name="" index="4" field="x"/>
    <alias name="" index="5" field="y"/>
    <alias name="" index="6" field="outcode"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="" field="name"/>
    <default applyOnUpdate="0" expression="" field="type"/>
    <default applyOnUpdate="0" expression="" field="sub_type"/>
    <default applyOnUpdate="0" expression="" field="x"/>
    <default applyOnUpdate="0" expression="" field="y"/>
    <default applyOnUpdate="0" expression="" field="outcode"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" constraints="3" exp_strength="0" unique_strength="1" field="id"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="name"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="type"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="sub_type"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="x"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="y"/>
    <constraint notnull_strength="0" constraints="0" exp_strength="0" unique_strength="0" field="outcode"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="id"/>
    <constraint desc="" exp="" field="name"/>
    <constraint desc="" exp="" field="type"/>
    <constraint desc="" exp="" field="sub_type"/>
    <constraint desc="" exp="" field="x"/>
    <constraint desc="" exp="" field="y"/>
    <constraint desc="" exp="" field="outcode"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" sortExpression="" actionWidgetStyle="dropDown">
    <columns>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="name" hidden="0"/>
      <column width="-1" type="field" name="type" hidden="0"/>
      <column width="-1" type="field" name="sub_type" hidden="0"/>
      <column width="-1" type="field" name="x" hidden="0"/>
      <column width="-1" type="field" name="y" hidden="0"/>
      <column width="-1" type="field" name="outcode" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">D:/PROGRA~1/QGIS3~1.4/bin</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>D:/PROGRA~1/QGIS3~1.4/bin</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="id"/>
    <field editable="1" name="name"/>
    <field editable="1" name="outcode"/>
    <field editable="1" name="sub_type"/>
    <field editable="1" name="type"/>
    <field editable="1" name="x"/>
    <field editable="1" name="y"/>
  </editable>
  <labelOnTop>
    <field name="id" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="outcode" labelOnTop="0"/>
    <field name="sub_type" labelOnTop="0"/>
    <field name="type" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
